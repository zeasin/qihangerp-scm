import request from '@/utils/request'

// 查询店铺列表
export function listMerchant(query) {
  return request({
    url: '/scm-api/merchant/list',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getMerchant(id) {
  return request({
    url: '/scm-api/merchant/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addMerchant(data) {
  return request({
    url: '/scm-api/merchant',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateMerchant(data) {
  return request({
    url: '/scm-api/merchant',
    method: 'put',
    data: data
  })
}

