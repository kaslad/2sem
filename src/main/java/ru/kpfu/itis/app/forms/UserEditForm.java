package ru.kpfu.itis.app.forms;

import lombok.*;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserEditForm {
    private String id;
    private String login;
    private String name;
    private String role;
    private String email;
    private String password1;
    private String password2;
    //private String status;


}