import request from '@/utils/request'


export function getOAuthUrl(query) {
  return request({
    url: '/api/vms-api/shop/oauth/getOAuthUrl',
    method: 'get',
    params: query
  })
}
export function getToken(data) {
  return request({
    url: '/api/vms-api/shop/oauth/getToken',
    method: 'post',
    data: data
  })
}
