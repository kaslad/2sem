package ru.kpfu.itis.app.model;


import lombok.*;
import ru.kpfu.itis.app.model.enums.RacquetString;
import ru.kpfu.itis.app.model.enums.StringApplicationState;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
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
    @JoinColumn(name = "stringer_id")
    private Stringer stringer;

    @NotNull
    private Short horizontalWeight;
    @NotNull
    private Short verticalWeight;
    @NotNull
    private String name;


    @Enumerated(EnumType.STRING)
    private RacquetString racquetString;

    @Enumerated(EnumType.STRING)
    private StringApplicationState state;

    private Timestamp timeStart;
    private Timestamp timeFinish;



}
