import request from '@/utils/request'


export function getPddOAuthUrl(query) {
  return request({
    url: '/api/store-api/pdd/getOauthUrl',
    method: 'get',
    params: query
  })
}
export function getPddToken(data) {
  return request({
    url: '/api/store-api/pdd/getToken',
    method: 'post',
    data: data
  })
}
export function pullLogisticsCompanyListPdd(data) {
  return request({
    url: '/api/store-api/pdd/logistics/pull_logistics_company',
    method: 'post',
    data: data
  })
}
export function pullLogisticsTemplateListPdd(data) {
  return request({
    url: '/api/store-api/pdd/logistics/pullTemplateList',
    method: 'post',
    data: data
  })
}
