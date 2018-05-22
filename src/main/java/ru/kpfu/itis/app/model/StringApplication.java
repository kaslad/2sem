package ru.kpfu.itis.app.model;

import lombok.*;
import ru.kpfu.itis.app.model.enums.RacquetString;
import ru.kpfu.itis.app.model.enums.State;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "string_application")
public class StringApplication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_id", nullable = false)
    private Client client;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "stringer_id", nullable = false)
    private Stringer stringer;

    private Short HorizontalWeight;
    private Short VerticalWeight;


    @Enumerated(EnumType.STRING)
    private RacquetString racquetString;

    @Enumerated(EnumType.STRING)
    private State state;

    private Timestamp timeStart;
    private Timestamp timeFinish;



}
