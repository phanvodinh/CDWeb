package WebSpringMVC.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    DataSource dataSource;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin/**").hasRole("admin") // Chỉ cho phép user có role là admin truy cập vào đường dẫn có admin/
                .anyRequest().permitAll() // Cho phép truy cập vào các đường dẫn khác
                .and()
                .formLogin()
                .loginPage("/admin/login") // Trang đăngnhập
                .loginProcessingUrl("/admin/authenticate") // URL xử lý đăng nhập
                .usernameParameter("user").passwordParameter("password")
                .defaultSuccessUrl("/admin/category")// Trang chuyển hướng sau khi đăng nhập thành công
                .permitAll()
                .failureUrl("/admin/login?error=failed")
                .and().
                exceptionHandling().
                accessDeniedPage("/admin/login?error=denny");
//                .logout()
//                .permitAll();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("admin").password("{noop}admin").roles("admin");
// Thêm user có username và password là "admin" với role là "admin"
//        auth.jdbcAuthentication().dataSource(dataSource)
//                .usersByUsernameQuery("select u.user, u.password from user u where u.user= ?")
//                .authoritiesByUsernameQuery("select u.user, u.role from user u where u.user = ?");
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        super.configure(web);
    }
}
