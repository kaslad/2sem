package ru.kpfu.itis.app.controllers;

import com.sun.tools.javac.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.StringApplication;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;
import ru.kpfu.itis.app.model.enums.StringApplicationState;
import ru.kpfu.itis.app.services.CoachService;
import ru.kpfu.itis.app.utils.AjaxResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private CoachService coachService;

    @GetMapping("")
    public String getSearchPage() {
        return "search";
    }

    @GetMapping("/ajax")
    public ResponseEntity<?> searchAjax(@RequestParam String cost1,
                                                           @RequestParam String cost2,
                             Authentication authentication) {
        System.out.println("herrrrrrrrrrrrr");
        Integer price1 = Integer.parseInt(cost1);
        System.out.println("price = " + price1);
        Integer price2 = Integer.parseInt(cost2);
        AjaxResponseBody result = new AjaxResponseBody();

        List<Coach> coaches = coachService.findAllByPriceIn(price1, price2);
        if(coaches.isEmpty()){
            result.setMsg("no");
        }else {
            result.setMsg("success");
            result.setResult(new ArrayList<Pair<Coach, User>>());
            for(int i = 0; i < coaches.size(); i++){
                User user = coaches.get(i).getUser();
                Pair<Coach, User> pair = new Pair<>(coaches.get(i), user);
                result.getResult().add(pair);
            }
        }
        return  ResponseEntity.ok(result);

    }

    @RequestMapping(value = "", method = RequestMethod.GET, params = {"keywords", "playerDegree", "coachDegree"})
    public String getResults(@RequestParam String keywords, @RequestParam String playerDegree,
                                  @RequestParam String coachDegree,
                                  @ModelAttribute("model") ModelMap model,
                                  Authentication authentication) {

        System.out.println("in get Results ");
        List<javafx.util.Pair<Coach,User>> result = new ArrayList<>();
        List<Coach> coaches = coachService.findAllByCoachDegreeAndPlayerDegreeAndUserNameContaining(CoachDegree.valueOf(coachDegree), PlayerDegree.valueOf(playerDegree), keywords);
        User usr = null;
        if (coaches.isEmpty()) {
        } else {

            for (int i = 0; i < coaches.size(); i++) {
                User user = coaches.get(i).getUser();
                usr = user;
                javafx.util.Pair<Coach,User> pair = new javafx.util.Pair<>(coaches.get(i), user);
                result.add(pair);
            }
        }
        model.addAttribute("result", result);
        model.addAttribute("pair", new javafx.util.Pair<User, Integer>(usr,5));


        return "search";
    }

}
