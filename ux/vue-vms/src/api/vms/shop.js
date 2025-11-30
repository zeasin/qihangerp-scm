import request from '@/utils/request'


// 查询店铺平台列表
export function listPlatform(query) {
  return request({
    url: '/scm-api/shop/platformList',
    method: 'get',
    params: query
  })
}

// 查询店铺列表
export function listShop(query) {
  return request({
    url: '/scm-api/shop/list',
    method: 'get',
    params: query
  })
}
