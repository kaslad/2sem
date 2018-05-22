package ru.kpfu.itis.app.model;

import lombok.*;

import ru.kpfu.itis.app.model.enums.Sex;
import ru.kpfu.itis.app.security.role.Role;

import javax.persistence.*;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "\"user\"")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String phone;

    private Integer age;

    @Enumerated(EnumType.STRING)
    private Sex sex;



    @Column(unique = true)
    private String login;

    private String hashPassword;



    // Role, only one not null
    @OneToOne(fetch = FetchType.LAZY)
    private Manager manager;
    @OneToOne(fetch = FetchType.LAZY)
    private Client client;
    @OneToOne(fetch = FetchType.LAZY)
    private Stringer stringer;
    @OneToOne(fetch = FetchType.LAZY)
    private Coach coach;

    @Enumerated(EnumType.STRING)
    private Role role;



    private String hashTempPassword;
    private String email;

}
