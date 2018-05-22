package ru.kpfu.itis.app.model;

import lombok.*;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;
import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "coach")
public class Coach {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    private PlayerDegree playerDegree;
    @Enumerated(EnumType.STRING)
    private CoachDegree coachDegree;
    // per hour price
    private Integer price;







}
