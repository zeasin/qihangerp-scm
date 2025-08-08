package cn.qihangerp.api.resp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthLoginRespVO {


    private Long userId;


    private String accessToken;


    private String refreshToken;


    private LocalDateTime expiresTime;

}
