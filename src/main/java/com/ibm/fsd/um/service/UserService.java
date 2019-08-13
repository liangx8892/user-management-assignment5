package com.ibm.fsd.um.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibm.fsd.um.dao.UserDao;
import com.ibm.fsd.um.entity.User;
import com.ibm.fsd.um.exception.CustomException;


@Service("userDetailService")
public class UserService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
    @Autowired
    private UserDao userDao;

    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    public User findByUsername(String username) {
    	logger.info("userDao: {}", userDao);
        return userDao.findByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = this.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User does not exist.");
        }

        GrantedAuthority roleUser = new SimpleGrantedAuthority("ROLE_USER");

        Collection<GrantedAuthority> grantedAuths = new ArrayList<>();
        grantedAuths.add(roleUser);

        if (user.isAdmin()) {
            GrantedAuthority roleAdmin = new SimpleGrantedAuthority("ROLE_ADMIN");
            grantedAuths.add(roleAdmin);
        }

        return new org.springframework.security.core.userdetails.User(username, user.getPassword(), grantedAuths);

    }

    public User saveUser(User user) {
        return userDao.saveUser(user);
    }

    public void updateUser(User user) {
        if (user.getPassword() != null && !user.getPassword().equals(user.getPasswordConfirm())) {
            throw new CustomException("password and password re-entered does not match.");
        }
        userDao.updateUser(user);
    }
}
