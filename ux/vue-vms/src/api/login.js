import request from '@/utils/request'

// 登录方法
export function login(username, password, code, uuid) {
  const data = {
    username,
    password,
    code,
    uuid
  }
  return request({
    url: '/api/vms-api/login',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
  })
}



// 获取用户详细信息
export function getInfo() {
  return request({
    url: '/api/vms-api/getInfo',
    method: 'get'
  })
}

// 退出方法
export function logout() {
  return request({
    url: '/api/vms-api/logout',
    method: 'post'
  })
}


