package ru.cardinal.servicecentr.services.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.cardinal.servicecentr.models.UserEntity;
import ru.cardinal.servicecentr.models.enums.Role;
import ru.cardinal.servicecentr.repositories.UserRepository;
import ru.cardinal.servicecentr.services.UserService;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Service
//@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

  public UserServiceImpl(UserRepository userRepository, PasswordEncoder passwordEncoder) {
    this.userRepository = userRepository;
    this.passwordEncoder = passwordEncoder;
  }

  public boolean createUser(UserEntity user) {
        String username = user.getUsername();
        if (userRepository.findByUsername(username).isPresent()) return false;
        user.setUsername(username.toLowerCase());
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.USER);

        userRepository.save(user);
        return true;
    }

    @Override
    public UserEntity getUserByPrincipal(Principal principal) {
        return userRepository.findByUsername(principal.getName().toLowerCase()).orElse(new UserEntity());
    }

    @Override
    public List<UserEntity> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void changeActiveStatus(Long id) {
        Optional<UserEntity> user = userRepository.findById(id);
        user.ifPresent(userEntity -> {
            userEntity.setActive(!userEntity.isActive());
            userRepository.save(userEntity);
        });

    }
}
