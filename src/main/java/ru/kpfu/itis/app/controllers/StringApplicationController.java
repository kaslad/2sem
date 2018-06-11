package ru.kpfu.itis.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.kpfu.itis.app.forms.StringApplicationForm;
import ru.kpfu.itis.app.model.StringApplication;
import ru.kpfu.itis.app.model.enums.StringApplicationState;
import ru.kpfu.itis.app.services.AuthenticationService;
import ru.kpfu.itis.app.services.ClientService;
import ru.kpfu.itis.app.services.StringApplicationService;

import java.util.List;

@Controller
@RequestMapping("/client/strings")
public class StringApplicationController {
    @Autowired
    private StringApplicationService stringService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private AuthenticationService authenticationService;

    public StringApplicationController(StringApplicationService stringService) {
        this.stringService = stringService;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getApplications() {
        System.out.println("here");
        return "stringer-application-form";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getApplicationPage(@PathVariable("id") Long stringId, @ModelAttribute("model") ModelMap model) {
        model.addAttribute("string", stringService.getById(stringId).orElse(null));
        return "string-page";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String apply(@ModelAttribute StringApplicationForm stringApplicationForm, Authentication authentication) {
        stringService.create(stringApplicationForm, authentication);
        return "redirect:/client/strings/";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getNewApplications(@ModelAttribute("model") ModelMap model, Authentication authentication) {

        List<StringApplication> stringApplications = stringService.getStringApplicationByState(StringApplicationState.NEW);
        model.addAttribute("applications", stringService.getStringApplicationByStateAndClient(
                StringApplicationState.NEW, clientService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get()
        ));
        model.addAttribute("state", StringApplicationState.NEW.name());


        return "client-applications-page";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET, params = "state")
    public String getApplications(@RequestParam String state, @ModelAttribute("model") ModelMap model,
                                  Authentication authentication) {

        List<StringApplication> stringApplications = stringService.getStringApplicationByState(StringApplicationState.NEW);
        model.addAttribute("applications", stringService.getStringApplicationByStateAndClient(
                StringApplicationState.valueOf(state), clientService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get()
        ));
        System.out.println(stringApplications.size());
        model.addAttribute("state", StringApplicationState.valueOf(state).name());


        return "client-applications-page";
    }


    /*@RequestMapping(value = "/{state}", method = RequestMethod.GET)
    public String getProgressApplications(@PathVariable("state") String state, @ModelAttribute("model") ModelMap model) {
        System.out.println("here");
        model.addAttribute("applications", stringService.getStringApplicationByState(
                StringApplicationState.valueOf(state)
        ));

        return "client-applications-page";    }
        */

    @RequestMapping(value = "/review", method = RequestMethod.POST)
    public String getReviewApplications(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("applications", stringService.getStringApplicationByState(
                StringApplicationState.REVIEW
        ));
        return "client-applications-page";
    }


    @RequestMapping(value = "/archive", method = RequestMethod.POST)
    public String getCancelledApplications(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("applications", stringService.getStringApplicationByState(
                StringApplicationState.CANCELLED

        ));
        return "client-applications-page";
    }

}
