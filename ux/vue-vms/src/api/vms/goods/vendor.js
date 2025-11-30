import request from '@/utils/request'

// 查询店铺列表
export function listVendor(query) {
  return request({
    url: '/erp-api/vendor/list',
    method: 'get',
    params: query
  })
}
