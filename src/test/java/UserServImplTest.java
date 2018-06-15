import com.google.common.collect.Lists;
import org.junit.Assert;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import ru.kpfu.itis.app.Application;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.ClientRepository;
import ru.kpfu.itis.app.repositories.UsersRepository;
import ru.kpfu.itis.app.security.role.Role;
import ru.kpfu.itis.app.services.ClientService;
import ru.kpfu.itis.app.services.UserService;

import java.util.List;
import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment =
        SpringBootTest.WebEnvironment.MOCK,
        classes = Application.class)
@AutoConfigureMockMvc
@TestPropertySource(
        locations = "classpath:application-dev.properties")
public class UserServImplTest {
    @Autowired
    private UserService userService;
    @Autowired
    private ClientService clientService;


    @MockBean
    private ClientRepository clientRepository;
    @MockBean
    private UsersRepository usersRepository;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    @Before
    public void setUp() {
        User user1 = User.builder()
                .id(1L)
                .name("vlad")
                .login("user1")
                .email("user1@mail.ru")
                .hashPassword(passwordEncoder.encode("password"))
                .role(Role.fromString("CLIENT"))
                .build();

        User user2 = User.builder()
                .id(2L)
                .name("vladik")
                .login("user2")
                .email("user1@mail.ru")
                .hashPassword(passwordEncoder.encode("password"))
                .role(Role.fromString("CLIENT"))
                .build();
        Mockito.when(usersRepository.findOneByLogin(user1.getLogin())).thenReturn(Optional.of(user1));
        Mockito.when(usersRepository.findById(user1.getId())).thenReturn(Optional.of(user1));
        Mockito.when(usersRepository.findById(user2.getId())).thenReturn(Optional.of(user2));
        Mockito.when(usersRepository.findAllByNameContaining("vl")).thenReturn(Lists.newArrayList(user1, user2));
        Mockito.when(usersRepository.findAll()).thenReturn(Lists.newArrayList(user1, user2));
    }


    @Test
    public void whenGetUserById_thenReturnCorrectUser() {
        Long id = 1L;
        User user = userService.getById(id);
        assertEquals(user.getId(), id);
    }


    @Test
    public void whenFindAllByNameContaining_thenReturnAllUserList(){
        List<User> all = userService.findAllByNameContaining("vl");
        assertEquals(2,all.size());
    }

    @Test
    public void whenGetAllUser_thenReturnAllUserList() {
        List<User> all = userService.getAll();
        System.out.println(all.get(0).getName());
        assertEquals(2, all.size());

    }


    @Test
    public void whenFindUserByLogin_thenReturnCorrectUser(){
        String login = "user1";

        assertEquals(login, userService.findOneByLogin(login).get().getLogin() );
    }

}
