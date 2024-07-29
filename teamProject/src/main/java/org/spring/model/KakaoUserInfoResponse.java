package org.spring.model;

import lombok.Data;

@Data
public class KakaoUserInfoResponse {
    private Long id;
    private String connected_at;
    private KakaoAccount kakao_account;

    // Getters and Setters
    @Data
    public static class KakaoAccount {
        private Boolean name_needs_agreement;
        private String name;
        private Boolean has_email;
        private Boolean email_needs_agreement;
        private Boolean is_email_valid;
        private Boolean is_email_verified;
        private String email;
        private Boolean has_phone_number;
        private Boolean phone_number_needs_agreement;
        private String phone_number;

        // Getters and Setters
        public Boolean getName_needs_agreement() {
            return name_needs_agreement;
        }

        public void setName_needs_agreement(Boolean name_needs_agreement) {
            this.name_needs_agreement = name_needs_agreement;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Boolean getHas_email() {
            return has_email;
        }

        public void setHas_email(Boolean has_email) {
            this.has_email = has_email;
        }

        public Boolean getEmail_needs_agreement() {
            return email_needs_agreement;
        }

        public void setEmail_needs_agreement(Boolean email_needs_agreement) {
            this.email_needs_agreement = email_needs_agreement;
        }

        public Boolean getIs_email_valid() {
            return is_email_valid;
        }

        public void setIs_email_valid(Boolean is_email_valid) {
            this.is_email_valid = is_email_valid;
        }

        public Boolean getIs_email_verified() {
            return is_email_verified;
        }

        public void setIs_email_verified(Boolean is_email_verified) {
            this.is_email_verified = is_email_verified;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public Boolean getHas_phone_number() {
            return has_phone_number;
        }

        public void setHas_phone_number(Boolean has_phone_number) {
            this.has_phone_number = has_phone_number;
        }

        public Boolean getPhone_number_needs_agreement() {
            return phone_number_needs_agreement;
        }

        public void setPhone_number_needs_agreement(Boolean phone_number_needs_agreement) {
            this.phone_number_needs_agreement = phone_number_needs_agreement;
        }

        public String getPhone_number() {
            return phone_number;
        }

        public void setPhone_number(String phone_number) {
            this.phone_number = phone_number;
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getConnected_at() {
        return connected_at;
    }

    public void setConnected_at(String connected_at) {
        this.connected_at = connected_at;
    }

    public KakaoAccount getKakao_account() {
        return kakao_account;
    }

    public void setKakao_account(KakaoAccount kakao_account) {
        this.kakao_account = kakao_account;
    }
}