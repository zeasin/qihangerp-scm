import request from '@/utils/request'

// 查询店铺列表
export function listShop(query) {
  return request({
    url: '/scm-api/shop/list',
    method: 'get',
    params: query
  })
}

export function listShopPage(query) {
  return request({
    url: '/scm-api/shop/pageList',
    method: 'get',
    params: query
  })
}
// 获取店铺拉取时间
export function getShopPullTime(id) {
  return request({
    url: '/scm-api/shop/getPullTime/' + id,
    method: 'get'
  })
}
// 保存店铺拉取时间
export function saveShopPullTime(data) {
  return request({
    url: '/scm-api/shop/saveShopPullTime',
    method: 'post',
    data: data
  })
}

// 查询店铺详细
export function getShop(id) {
  return request({
    url: '/scm-api/shop/shop/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addShop(data) {
  return request({
    url: '/scm-api/shop/shop',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateShop(data) {
  return request({
    url: '/scm-api/shop/shop',
    method: 'put',
    data: data
  })
}

// 删除店铺
export function delShop(id) {
  return request({
    url: '/scm-api/shop/shop/' + id,
    method: 'delete'
  })
}


export function updateShopManage(data) {

  return request({
    url: '/scm-api/shop/shop/updateShopManage',
    method: 'put',
    data: data
  })
}
// 查询店铺平台列表
export function listPlatform(query) {
  return request({
    url: '/scm-api/shop/platformList',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getPlatform(id) {
  return request({
    url: '/scm-api/shop/platform/' + id,
    method: 'get'
  })
}

// 修改店铺
export function updatePlatform(data) {
  return request({
    url: '/scm-api/shop/platform',
    method: 'put',
    data: data
  })
}

// 角色状态修改
export function changePlatformStatus(id, status) {
  const data = {
    id,
    status
  }
  return request({
    url: '/scm-api/shop/platform/changeStatus',
    method: 'put',
    data: data
  })
}

// 新增店铺
export function addPlatform(data) {
  return request({
    url: '/scm-api/shop/platform',
    method: 'post',
    data: data
  })
}


export function listShopPullLogs(query) {
  return request({
    url: '/scm-api/shop/pull_logs_list',
    method: 'get',
    params: query
  })
}
