package ru.kpfu.itis.app.model;

import lombok.*;


import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode
@Entity
@ToString
@Table(name = "\"question\"")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String answer;

    @Column
    private Boolean answered = false;

    public String isAnswered() {
        return answered == null ? "no" : (answered ? "yes" : "no");
    }

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "coach_id")
    private Coach coach;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "client_id")
    private Client author;

    @Column
    private String content;

    @Column
    private Date date;
}