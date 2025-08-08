<template>
  <div class="login-container">
    <div class="login-background"></div>
    <div class="login-content">
      <div class="login-card">
        <div class="login-header">
          <div class="logo-container">
            <svg-icon icon-class="logo" class="logo-icon" />
            <h1 class="system-title">{{ appStore.getTitle }}</h1>
          </div>
          <p class="welcome-text">欢迎回来，请登录您的账户</p>
        </div>

        <div class="tabs">
          <div
            class="tab-item"
            :class="{ active: activeTab === 1 }"
            @click="activeTab = 1"
          >
            <svg-icon icon-class="user" class="tab-icon" />
            账号密码登录
          </div>
        </div>

        <div class="login-form">
          <!-- 账号密码登录 -->
          <el-form
            ref="loginFormRef"
            :model="loginForm"
            :rules="loginRules"
            @keyup.enter="handleLogin"
          >
            <el-form-item prop="username">
              <el-input
                v-model="loginForm.username"
                placeholder="请输入用户名"
                size="large"
                clearable
              >
                <template #prefix>
                  <svg-icon icon-class="user" class="input-icon" />
                </template>
              </el-input>
            </el-form-item>

            <el-form-item prop="password">
              <el-input
                v-model="loginForm.password"
                :type="showPassword ? 'text' : 'password'"
                placeholder="请输入密码"
                size="large"
                clearable
              >
                <template #prefix>
                  <svg-icon icon-class="password" class="input-icon" />
                </template>
                <template #suffix>
                  <svg-icon
                    :icon-class="showPassword ? 'eye-open' : 'eye-close'"
                    class="password-eye"
                    @click="showPassword = !showPassword"
                  />
                </template>
              </el-input>
            </el-form-item>

            <el-form-item v-if="captchaEnabled" prop="code">
              <div class="captcha-container">
                <el-input
                  v-model="loginForm.code"
                  placeholder="请输入验证码"
                  size="large"
                  style="flex: 1; margin-right: 12px;"
                  clearable
                >
                  <template #prefix>
                    <svg-icon icon-class="validCode" class="input-icon" />
                  </template>
                </el-input>
                <div class="captcha-image" @click="getCaptcha">
                  <img :src="captchaImage" alt="验证码" />
                </div>
              </div>
            </el-form-item>

            <div class="remember-row">
              <el-checkbox v-model="loginForm.rememberMe">记住密码</el-checkbox>
              <el-link type="primary" :underline="false">忘记密码?</el-link>
            </div>

            <el-form-item>
              <el-button
                type="primary"
                size="large"
                :loading="loading"
                @click="handleLogin"
                class="login-button"
              >
                {{ loading ? '登录中...' : '立即登录' }}
              </el-button>
            </el-form-item>
          </el-form>
        </div>

        <div class="other-login">
          <div class="divider">
            <span class="divider-text">其他登录方式</span>
          </div>
          <div class="login-methods">
            <el-tooltip content="微信登录" placement="top">
              <div class="login-method wechat">
                <svg-icon icon-class="wechat" />
              </div>
            </el-tooltip>
            <el-tooltip content="手机登录" placement="top">
              <div class="login-method mobile">
                <svg-icon icon-class="mobile" />
              </div>
            </el-tooltip>
            <el-tooltip content="邮箱登录" placement="top">
              <div class="login-method email">
                <svg-icon icon-class="email" />
              </div>
            </el-tooltip>
          </div>
        </div>
      </div>
    </div>

    <div class="login-footer">
      <p>Copyright © 2023-2025 {{ appStore.getTitle }} 版权所有</p>
      <p>技术支持：400-888-8888 | 邮箱：support@example.com</p>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage, ElNotification, type FormInstance, ElLoading } from 'element-plus';
import Cookies from 'js-cookie';
import { encrypt, decrypt } from '@/utils/jsencrypt';
// import { getCodeImg } from '@/api/login';
import { useAppStore } from '@/store/modules/app';
import * as LoginApi from '@/api/login';
import * as authUtil from '@/utils/auth';

// 定义登录表单接口
interface LoginForm {
  username: string;
  password: string;
  rememberMe: boolean;
  code: string;
  uuid: string;
  captchaVerification: string;
}

export default defineComponent({
  name: 'LoginPage',
  setup() {
    const router = useRouter();
    const appStore = useAppStore();

    // 响应式数据
    const activeTab = ref(1);
    const loginForm = ref<LoginForm>({
      username: '',
      password: '',
      rememberMe: false,
      code: '',
      uuid: '',
      captchaVerification: ''
    });
    const loading = ref(false);
    const captchaEnabled = ref(import.meta.env.VITE_APP_CAPTCHA_ENABLE === 'false');
    const captchaImage = ref('');
    const showPassword = ref(false);
    const loginFormRef = ref<FormInstance | null>(null);

    // 表单验证规则
    const loginRules = {
      username: [
        { required: true, message: '请输入用户名', trigger: 'blur' },
        { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
      ],
      password: [
        { required: true, message: '请输入密码', trigger: 'blur' },
        { min: 8, max: 32, message: '长度在 8 到 32 个字符', trigger: 'blur' }
      ],
      // code: [
      //   { required: true, message: '请输入验证码', trigger: 'blur' },
      //   { len: 4, message: '验证码长度为4位', trigger: 'blur' }
      // ]
    };

    // 获取验证码
    const getCaptcha = async () => {
      try {
        const res = await getCodeImg();
        captchaEnabled.value = res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (captchaEnabled.value) {
          captchaImage.value = `data:image/gif;base64,${res.img}`;
          loginForm.value.uuid = res.uuid;
        }
      } catch (error) {
        ElMessage.error('获取验证码失败');
        // 提供默认验证码
        captchaImage.value = 'https://via.placeholder.com/120x40?text=验证码';
      }
    };

    // 处理登录 - 从 LoginForm.vue 中提取的真实登录逻辑
    const handleLogin = async () => {
      if (!loginFormRef.value) return;

      try {
        // 验证表单
        const valid = await loginFormRef.value.validate();
        if (!valid) return;

        loading.value = true;

        // 真实登录逻辑
        const loginData = {
          username: loginForm.value.username,
          password: loginForm.value.password,
          code: loginForm.value.code,
          uuid: loginForm.value.uuid,
          rememberMe: loginForm.value.rememberMe
        };

        // 调用登录API
        const res = await LoginApi.login(loginData);
        if (!res) {
          throw new Error('登录失败');
        }

        // 设置token
        authUtil.setToken(res);

        // 记住密码逻辑
        if (loginForm.value.rememberMe) {
          Cookies.set('username', loginForm.value.username, { expires: 30 });
          Cookies.set('password', encrypt(loginForm.value.password), { expires: 30 });
          Cookies.set('rememberMe', String(loginForm.value.rememberMe), { expires: 30 });
        } else {
          Cookies.remove('username');
          Cookies.remove('password');
          Cookies.remove('rememberMe');
        }

        // 显示加载动画
        const loadingInstance = ElLoading.service({
          lock: true,
          text: '正在登录中...',
          background: 'rgba(0, 0, 0, 0.7)'
        });

        // 登录成功提示
        ElNotification({
          title: '登录成功',
          message: `欢迎回来，${loginForm.value.username}！`,
          type: 'success',
          duration: 2000
        });

        // 设置用户信息到store
        // appStore.setUserInfo({
        //   username: loginForm.value.username,
        //   roles: ['admin'], // 实际应从API获取
        //   permissions: ['*:*:*'] // 实际应从API获取
        // });

        // 跳转到首页
        setTimeout(() => {
          loadingInstance.close();
          router.push({ path: '/index' });
        }, 1000);
      } catch (error) {
        console.log(error);
        // ElMessage.error('登录失败，请检查用户名和密码');
        // if (captchaEnabled.value) {
        //   getCaptcha();
        // }
      } finally {
        loading.value = false;
      }
    };

    // 获取 Cookie
    const getCookie = () => {
      const username = Cookies.get('username');
      const password = Cookies.get('password');
      const rememberMe = Cookies.get('rememberMe');

      if (username) loginForm.value.username = username;
      if (password) loginForm.value.password = decrypt(password) || '';
      if (rememberMe) loginForm.value.rememberMe = rememberMe === 'true';
    };

    // 生命周期钩子
    onMounted(() => {
      appStore.setIsDark(false); // 确保不是暗黑模式
      getCookie();
      // getCaptcha();
    });

    return {
      appStore,
      activeTab,
      loginForm,
      loading,
      captchaEnabled,
      captchaImage,
      showPassword,
      loginFormRef,
      loginRules,
      getCaptcha,
      handleLogin
    };
  }
});
</script>

<style lang="scss" scoped>
.login-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
  overflow: hidden;
  position: relative;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);

  .login-background {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23a2b9ee" fill-opacity="0.2" d="M0,160L48,170.7C96,181,192,203,288,192C384,181,480,139,576,133.3C672,128,768,160,864,181.3C960,203,1056,213,1152,202.7C1248,192,1344,160,1392,144L1440,128L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
    background-size: cover;
    background-position: center;
    z-index: 1;
  }

  .login-content {
    display: flex;
    justify-content: center;
    align-items: center;
    flex: 1;
    padding: 20px;
    z-index: 2;
  }

  .login-card {
    width: 100%;
    max-width: 460px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    padding: 40px 36px;
    transition: all 0.3s ease;

    &:hover {
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
      transform: translateY(-5px);
    }
  }

  .login-header {
    text-align: center;
    margin-bottom: 32px;

    .logo-container {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 12px;
      margin-bottom: 16px;

      .logo-icon {
        font-size: 36px;
        color: #409EFF;
      }

      .system-title {
        font-size: 24px;
        font-weight: 700;
        color: #303133;
        margin: 0;
      }
    }

    .welcome-text {
      font-size: 15px;
      color: #606266;
      margin: 0;
    }
  }

  .tabs {
    display: flex;
    border-bottom: 1px solid #ebeef5;
    margin-bottom: 24px;

    .tab-item {
      padding: 0 20px 16px;
      cursor: pointer;
      font-size: 15px;
      color: #606266;
      display: flex;
      align-items: center;
      gap: 8px;
      position: relative;
      transition: all 0.3s;

      &.active {
        color: #409EFF;
        font-weight: 500;

        &::after {
          content: '';
          position: absolute;
          bottom: -1px;
          left: 0;
          right: 0;
          height: 3px;
          background: #409EFF;
          border-radius: 3px;
        }
      }

      .tab-icon {
        font-size: 18px;
      }
    }
  }

  .login-form {
    .input-icon {
      color: #c0c4cc;
      font-size: 18px;
    }

    .password-eye {
      cursor: pointer;
      color: #c0c4cc;
      font-size: 18px;
      transition: color 0.3s;

      &:hover {
        color: #409EFF;
      }
    }

    .captcha-container {
      display: flex;
      align-items: center;

      .captcha-image {
        width: 120px;
        height: 40px;
        border-radius: 4px;
        overflow: hidden;
        cursor: pointer;
        border: 1px solid #dcdfe6;
        transition: border-color 0.3s;

        &:hover {
          border-color: #409EFF;
        }

        img {
          width: 100%;
          height: 100%;
          display: block;
        }
      }
    }

    .remember-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 24px;
    }

    .login-button {
      width: 100%;
      font-size: 16px;
      letter-spacing: 2px;
      height: 48px;
      box-shadow: 0 4px 12px rgba(64, 158, 255, 0.3);
      transition: all 0.3s;

      &:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(64, 158, 255, 0.4);
      }

      &:active {
        transform: translateY(0);
      }
    }
  }

  .other-login {
    margin-top: 30px;

    .divider {
      position: relative;
      text-align: center;
      margin-bottom: 20px;

      &::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 0;
        right: 0;
        height: 1px;
        background: #ebeef5;
        z-index: 1;
      }

      .divider-text {
        position: relative;
        display: inline-block;
        padding: 0 12px;
        background: white;
        color: #909399;
        font-size: 14px;
        z-index: 2;
      }
    }

    .login-methods {
      display: flex;
      justify-content: center;
      gap: 24px;

      .login-method {
        width: 44px;
        height: 44px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s;
        font-size: 22px;
        color: white;

        &:hover {
          transform: translateY(-5px);
          box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        &.wechat {
          background: #67c23a;
        }

        &.mobile {
          background: #409EFF;
        }

        &.email {
          background: #e6a23c;
        }
      }
    }
  }

  .login-footer {
    text-align: center;
    padding: 20px;
    color: #909399;
    font-size: 13px;
    line-height: 1.6;
    z-index: 2;

    p {
      margin: 4px 0;
    }
  }
}

@media (max-width: 768px) {
  .login-card {
    padding: 30px 20px;
  }

  .login-header .system-title {
    font-size: 22px;
  }

  .tabs .tab-item {
    padding: 0 15px 12px;
    font-size: 14px;
  }
}
</style>
