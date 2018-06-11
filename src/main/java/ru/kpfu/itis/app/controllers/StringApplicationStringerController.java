package ru.kpfu.itis.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.kpfu.itis.app.forms.StringApplicationEditStatusForm;
import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.StringApplication;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.StringApplicationState;
import ru.kpfu.itis.app.services.AuthenticationService;
import ru.kpfu.itis.app.services.StringApplicationService;
import ru.kpfu.itis.app.services.StringerService;
import ru.kpfu.itis.app.services.UserService;

import java.util.List;

@Controller
@RequestMapping("/stringer/applications")
public class StringApplicationStringerController {
    @Autowired
    private StringApplicationService stringService;
    @Autowired
    private StringerService stringerService;
    @Autowired
    private AuthenticationService authenticationService;
    public StringApplicationStringerController(StringApplicationService stringService) {
        this.stringService = stringService;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getApplicationPage(@PathVariable("id") Long stringId, @ModelAttribute("model") ModelMap model) {
        model.addAttribute("string", stringService.getById(stringId).orElse(null));
        return "string-page-controller";
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getNewApplications(@ModelAttribute("model") ModelMap model, Authentication authentication) {

        List<StringApplication> stringApplications = stringService.getStringApplicationByState(StringApplicationState.NEW);
        model.addAttribute("applications", stringService.getStringApplicationByState(
                StringApplicationState.NEW));
        model.addAttribute("state", StringApplicationState.NEW.name());
        return "stringer-applications-page";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET, params = "state")
    public String getApplications(@RequestParam String state, @ModelAttribute("model") ModelMap model,
                                  Authentication authentication) {
        if(state.equals("NEW")){
            return getNewApplications(model,authentication);
        }

        model.addAttribute("applications", stringService.getStringApplicationByStringerAndState(
                 stringerService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get(),
                StringApplicationState.valueOf(state)
        ));

        model.addAttribute("state", StringApplicationState.valueOf(state).name());


        return "stringer-applications-page";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET, params = {"id", "state"})
    public String updateApplication(@RequestParam Long id, @RequestParam String state, @ModelAttribute("model") ModelMap model,
                                  StringApplicationEditStatusForm stringApplicationEditStatusForm,
                                  Authentication authentication) {

        stringService.changeApplicationState(id, StringApplicationState.valueOf(state), authenticationService.getUserByAuthentication(authentication));

        /*List<StringApplication> stringApplications = stringService.getStringApplicationByState(StringApplicationState.NEW);
        model.addAttribute("applications", stringService.getStringApplicationByStringerAndState(
                stringerService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get(),
                StringApplicationState.valueOf(state)
        ));
        System.out.println(stringApplications.size());
        model.addAttribute("state", StringApplicationState.valueOf(state).name());
        */


        return "redirect:/stringer/applications/";
    }



}
