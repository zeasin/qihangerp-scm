import request from '@/utils/request'

// 查询店铺列表
export function listVendor(query) {
  return request({
    url: '/erp-api/vendor/list',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getVendor(id) {
  return request({
    url: '/erp-api/vendor/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addVendor(data) {
  return request({
    url: '/erp-api/vendor',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateVendor(data) {
  return request({
    url: '/erp-api/vendor',
    method: 'put',
    data: data
  })
}

// 删除
export function delGoodsSpec(id) {
  return request({
    url: '/erp-api/vendor/' + id,
    method: 'delete'
  })
}
