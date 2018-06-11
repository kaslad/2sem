package ru.kpfu.itis.app.forms;

import lombok.*;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserEditForm {
    private String login;
    private String name;
    private String role;
    private String email;
    private String password1;
    private String password2;
    private String phone;
    private String sex;
    private String playerDegree;
    private String coachDegree;
    private String price;
    //private String status;


}