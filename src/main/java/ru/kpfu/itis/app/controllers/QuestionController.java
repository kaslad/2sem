package ru.kpfu.itis.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.Question;
import ru.kpfu.itis.app.services.*;

import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class QuestionController {


    @Autowired
    private QuestionService service;

    @Autowired
    private ClientService clientService;

    @Autowired
    private UserService userService;
    @Autowired
    private CoachService coachService;

    @Autowired
    private AuthenticationService authenticationService;

    @GetMapping("/client/question")
    public String showQuestion(@ModelAttribute("model") ModelMap model,
                               Authentication authentication) {

        model.addAttribute("client", clientService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get());

        return "ask_question";
    }

    @RequestMapping(value = "/client/question", method = RequestMethod.POST)
    public String askQuestion(@ModelAttribute("model") ModelMap model,
                              @RequestParam String content,
                              RedirectAttributes attributes,
                              Authentication authentication) {
        System.out.println("asking");
        Question question =
                service.addQuestion(content, clientService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get());

        attributes.addAttribute("id", question.getId());
        return "redirect:/client/all_questions";
    }

    @GetMapping("/coach/new_questions")
    public String getNewQuestions(@ModelAttribute("model") ModelMap model,
                                  Authentication authentication) {
        model.addAttribute("coach", coachService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get());

        model.addAttribute("questions", service.findAll()
                .stream()
                .filter((q) -> q.getAnswer() == null)
                .collect(Collectors.toList())
        );
        return "coach_new_questions";
    }

    @GetMapping("/coach/answered_questions")
    public String getAnsweredQuestions(@ModelAttribute("model") ModelMap model,
                                  Authentication authentication) {
        Coach coach = coachService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get();
        model.addAttribute("coach", coach);

        model.addAttribute("questions", service.findAllByCoach(coach));
        return "coach_answered_questions";
    }


    @RequestMapping(value = "/coach/new_questions", method = RequestMethod.POST)
    public String answer(@ModelAttribute("model") ModelMap model,
                         @RequestParam String answer,
                         @RequestParam Long id,
                         Authentication authentication,
                         RedirectAttributes attributes) {
        Optional<Question> opt = service.findOneById(id);
        if (!opt.isPresent()) return "redirect:/";
        Question question = opt.get();
        question = service.answer(question, answer, coachService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get());

        return "redirect:/coach/answered_questions";
    }

    @GetMapping("/client/concrete_question")
    public String showConcreteQuestion(@ModelAttribute("model") ModelMap model,
                                       @RequestParam Long id,
                                       Authentication authentication) {
        Optional<Question> opt = service.findOneById(id);
        if (!opt.isPresent()) {
            return "redirect:/client/all_questions";
        }
        model.addAttribute("question", opt.get());
        if (opt.get().getAnswered())
            model.addAttribute("answered", true);
        else
            model.addAttribute("answered", false);
        return "client_concrete_question";
    }

    @GetMapping("/client/all_questions")
    public String getAllQuestionsByClient(@ModelAttribute("model") ModelMap model,
                                          Authentication authentication) {
        model.addAttribute("client", clientService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get());
        model.addAttribute("questions", service.findAllByAuthor(clientService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get()));
        return "client_all_questions";
    }

    @GetMapping("/coach/concrete_question")
    public String showConcreteQuestionCoach(@ModelAttribute("model") ModelMap model,
                                          @RequestParam Long id,
                                          Authentication authentication) {
        model.addAttribute("coach", coachService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get());
        Optional<Question> opt = service.findOneById(id);
        if (!opt.isPresent()) {
            return "redirect:/coach/all_questions";
        }
        model.addAttribute("question", opt.get());
        if (opt.get().getAnswered())
            model.addAttribute("answered", true);
        else
            model.addAttribute("answered", false);
        return "coach_concrete_question";
    }




}