package ru.kpfu.itis.app.controllers;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.*;


import ru.kpfu.itis.app.security.role.Role;
import ru.kpfu.itis.app.services.*;

import ru.kpfu.itis.app.validators.UserEditFormValidator;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Optional;


@Controller
public class ProfileController {



    @Autowired
    private StringerService stringerService;
    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private UserEditFormValidator userEditFormValidator;

    @Autowired
    private ClientService clientService;

    @Autowired
    private CoachService coachService;

    @Autowired
    private DocumentService documentService;

    @InitBinder("userEditForm")
    public void initUserRegistrationFormValidator(WebDataBinder binder) {
        binder.addValidators(userEditFormValidator);
    }
    @GetMapping("/stringer/profile")
    public String getStringerProfile(@ModelAttribute("model")ModelMap model, Authentication authentication){
        User user = authenticationService.getUserByAuthentication(authentication);

        Stringer stringer = stringerService.findOneByUser(authenticationService.getUserByAuthentication(authentication));
        model.addAttribute("stringer", stringer);
        model.addAttribute("user", user);
        return "stringer_profile";

    }

    /*@GetMapping("/download")
    @SneakyThrows
    public String getCv(
            @RequestParam Long jobappId,
            @RequestParam Long id,
            HttpServletResponse response,
            Authentication authentication) {
        User user = authenticationService.getUserByAuthentication(authentication);
        if (user.getRole().equals(Role.CLIENT) ||
                user.getRole().equals(Role.POTENTIAL_PARTICIPANT)) {
            ParticipantData participant = participantService.getDataByUser(user).get();
            Optional<> jobAppOpt = jobAppService.findOneBy(jobappId);
            if (!jobAppOpt.isPresent()) {
                return "redirect:/";
            }
            JobApp jobApp = jobAppOpt.get();
            if (!jobApp.getAuthor().getId().equals(participant.getId())) {
                return "redirect:/";
            }
            Optional<Document> documentOpt = documentService.findById(id);
            if (!documentOpt.isPresent())
                return "redirect:/";
            Document document = documentOpt.get();
            if (!jobApp.getDocument().getId().equals(document.getId())) {
                return "redirect:/";
            }
            response.setContentType("application/pdf");
            response.setContentLength(document.getContent().length);
            FileCopyUtils.copy(document.getContent(), response.getOutputStream());
        }
        return "redirect:/";
    }
    */

    @RequestMapping(value = "/coach/profile", method = RequestMethod.POST)
    public String editCoachProfile(@Valid @ModelAttribute("userEditForm") UserEditForm userEditForm,
                              BindingResult errors,
                              Authentication authentication,
                              RedirectAttributes attributes
    ){

        if (errors.hasErrors()) {
            attributes.addFlashAttribute("error", errors.getAllErrors().get(0).getDefaultMessage());
            return "redirect:/coach/profile";
        }

        User user = authenticationService.getUserByAuthentication(authentication);

        userService.updateInfo(userEditForm, user);
        coachService.updateInfo(userEditForm, coachService.getDataByUser(user).get() );
        return "redirect:/coach/profile";
    }

    @RequestMapping(value = "/stringer/profile", method = RequestMethod.POST)
    public String editStringerProfile(@Valid @ModelAttribute("userEditForm") UserEditForm userEditForm,
                                   BindingResult errors,
                                   Authentication authentication,
                                   RedirectAttributes attributes
    ) {

        if (errors.hasErrors()) {
            attributes.addFlashAttribute("error", errors.getAllErrors().get(0).getDefaultMessage());
            return "redirect:/stringer/profile";
        }
        System.out.println("in edit Stringer profile");
        User user = authenticationService.getUserByAuthentication(authentication);

        userService.updateInfo(userEditForm, user);
        stringerService.updateInfo(userEditForm, stringerService.getDataByUser(user).get());
        return "redirect:/stringer/profile";
    }

    @RequestMapping(value = "/client/profile", method = RequestMethod.POST)
    public String editClientProfile(@Valid @ModelAttribute("userEditForm") UserEditForm userEditForm,
                                   BindingResult errors,
                                   Authentication authentication,
                                   RedirectAttributes attributes
    ) {
        System.out.println("herrrrrrrrrrrrr");

        if (errors.hasErrors()) {
            attributes.addFlashAttribute("error", errors.getAllErrors().get(0).getDefaultMessage());
            return "redirect:/client/profile";
        }
        User user = authenticationService.getUserByAuthentication(authentication);
        userService.updateInfo(userEditForm, user);
        System.out.println("here");
        clientService.updateInfo(userEditForm, clientService.getDataByUser(user).get());
        System.out.println(userEditForm.getPlayerDegree());
        return "redirect:/client/profile";
    }

    @GetMapping("/coach/profile")
    public String getCoachProfile(@ModelAttribute("model") ModelMap model, Authentication authentication) {
        User user = authenticationService.getUserByAuthentication(authentication);
        Coach coach = coachService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get();
        model.addAttribute("coach", coach);
        model.addAttribute("user", user);
        return "coach_profile";
    }

   /* @PostMapping("/manager/profile")
    public String editManagerProfile(@Valid @ModelAttribute("managerEditForm") ManagerEditForm managerEditForm,
                                     BindingResult errors,
                                     Authentication authentication,
                                     RedirectAttributes attributes) {

        if (errors.hasErrors()) {
            attributes.addFlashAttribute("error", errors.getAllErrors().get(0).getDefaultMessage());
            return "redirect:/manager/profile";
        }
        stringerService.updateInfo(managerEditForm, authenticationService.getUserByAuthentication(authentication));
        return "redirect:/manager/profile";

    }
    */

    @GetMapping("/client/profile")
    public String getClientProfile(@ModelAttribute("model") ModelMap model, Authentication authentication) {
        User user = authenticationService.getUserByAuthentication(authentication);
        Client client = clientService.findOneByUser(authenticationService.getUserByAuthentication(authentication));
        model.addAttribute("client", client);
        model.addAttribute("user", user);
        return "profile2";
    }

    /*@RequestMapping(value = "/participant/add_instrument")
    public @ResponseBody
    ResponseEntity<String> addInstrument(
            @RequestParam String ids, Authentication authentication) {
        System.out.println("in addInstrument");
        Long id = Long.parseLong(ids);
        System.out.println("id = " + id);

        clientService.addInstrument(
                authenticationService.getUserByAuthentication(authentication),
                instrumentRepository.findOneById(id).get());
        return new ResponseEntity<String>(HttpStatus.OK);
//        return "{\"msg\":\"success\"}";
//        return instrumentRepository.findOneById(id).get();
    }
    */
}
