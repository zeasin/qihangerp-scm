import request from '@/utils/request'

// 查询供应商all列表
export function listAllSupplier(query) {
  return request({
    url: '/api/oms-api/supplier/list_all',
    method: 'get',
    params: query
  })
}
// 查询供应商列表
export function listSupplier(query) {
  return request({
    url: '/api/oms-api/supplier/list',
    method: 'get',
    params: query
  })
}

// 查询供应商管理详细
export function getSupplier(id) {
  return request({
    url: '/api/oms-api/supplier/' + id,
    method: 'get'
  })
}

// 新增供应商管理
export function addSupplier(data) {
  return request({
    url: '/api/oms-api/supplier',
    method: 'post',
    data: data
  })
}

// 修改供应商管理
export function updateSupplier(data) {
  return request({
    url: '/api/oms-api/supplier',
    method: 'put',
    data: data
  })
}

// 删除供应商管理
export function delSupplier(id) {
  return request({
    url: '/api/oms-api/supplier/' + id,
    method: 'delete'
  })
}

export function setSupplierLoginName(data) {
  return request({
    url: '/api/oms-api/supplier/setLoginName',
    method: 'post',
    data: data
  })
}
