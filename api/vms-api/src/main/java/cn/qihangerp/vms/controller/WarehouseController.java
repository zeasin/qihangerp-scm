//package cn.qihangerp.vms.controller;
//
//import cn.qihangerp.common.AjaxResult;
//import cn.qihangerp.common.TableDataInfo;
//import cn.qihangerp.module.stock.domain.ErpVendorWarehouse;
//import cn.qihangerp.module.stock.domain.ErpVendorWarehousePosition;
//import cn.qihangerp.module.stock.domain.ErpWarehouse;
//import cn.qihangerp.module.stock.domain.ErpWarehousePosition;
//import cn.qihangerp.module.stock.service.ErpVendorWarehousePositionService;
//import cn.qihangerp.module.stock.service.ErpVendorWarehouseService;
//import cn.qihangerp.security.common.BaseController;
//import cn.qihangerp.security.utils.SecurityUtils;
//import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.AllArgsConstructor;
//import org.springframework.util.StringUtils;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Arrays;
//import java.util.Date;
//import java.util.List;
//
//@AllArgsConstructor
//@RestController
//@RequestMapping("/warehouse")
//public class WarehouseController extends BaseController {
//    private final ErpVendorWarehouseService vendorWarehouseService;
//    private final ErpVendorWarehousePositionService vendorWarehousePositionService;
//
//    @GetMapping("/list")
//    public TableDataInfo list(ErpWarehouse bo, HttpServletRequest request)
//    {
////        Long userId = JwtUtils.getUserIdFromToken(request);
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        LambdaQueryWrapper<ErpVendorWarehouse> qw = new LambdaQueryWrapper<ErpVendorWarehouse>()
//                .eq(ErpVendorWarehouse::getVendorId, userId)
//                .eq(bo.getStatus()!=null, ErpVendorWarehouse::getStatus, bo.getStatus())
//                .like(StringUtils.hasText(bo.getNumber()), ErpVendorWarehouse::getNumber,bo.getNumber())
//                .like(StringUtils.hasText(bo.getName()), ErpVendorWarehouse::getName,bo.getName())
//                ;
//        List<ErpVendorWarehouse> erpWarehouses = vendorWarehouseService.list(qw);
//        return getDataTable(erpWarehouses);
//    }
//
//
//    /**
//     * 添加仓库
//     * @param warehouse
//     * @param
//     * @return
//     */
//    @PostMapping
//    public AjaxResult add(@RequestBody ErpVendorWarehouse warehouse,HttpServletRequest request)
//    {
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        warehouse.setVendorId(userId);
//        warehouse.setCreateBy("");
//        warehouse.setCreateTime(new Date());
//        boolean save = vendorWarehouseService.save(warehouse);
//        if(save){
//            ErpVendorWarehousePosition position = new ErpVendorWarehousePosition();
//            position.setVendorId(userId);
//            position.setWarehouseId(warehouse.getId());
//            position.setParentId(0);
//            position.setParentId1(0);
//            position.setParentId2(0);
//            position.setNumber(warehouse.getNumber());
//            position.setName(warehouse.getName());
//            position.setIsDelete(0);
//            position.setAddress(warehouse.getAddress());
//            position.setRemark(warehouse.getRemark());
//            position.setCreateBy("");
//            position.setCreateTime(new Date());
//            vendorWarehousePositionService.save(position);
//        }
//        return AjaxResult.success();
//    }
//
//    @GetMapping(value = "/{id}")
//    public AjaxResult getInfo(@PathVariable("id") Long id)
//    {
//        return success(vendorWarehouseService.getById(id));
//    }
//
//
//
//    @PutMapping
//    public AjaxResult edit(@RequestBody ErpVendorWarehouse warehouse, HttpServletRequest request)
//    {
//        warehouse.setUpdateBy("");
//        warehouse.setUpdateTime(new Date());
//        return toAjax(vendorWarehouseService.updateById(warehouse));
//    }
//	@DeleteMapping("/{ids}")
//    public AjaxResult remove(@PathVariable Long[] ids)
//    {
//        return toAjax(vendorWarehouseService.removeBatchByIds(Arrays.stream(ids).toList()));
//    }
//
//    @GetMapping("/position/list")
//    public TableDataInfo positionList(Long warehouseId)
//    {
//        LambdaQueryWrapper<ErpVendorWarehousePosition> qw = new LambdaQueryWrapper<ErpVendorWarehousePosition>()
//                .eq(ErpVendorWarehousePosition::getWarehouseId,warehouseId)
//                ;
//        List<ErpVendorWarehousePosition> list = vendorWarehousePositionService.list(qw);
//        return getDataTable(list);
//    }
//    @GetMapping("/position/search")
//    public TableDataInfo searchPosition(Long warehouseId,String number)
//    {
//        LambdaQueryWrapper<ErpVendorWarehousePosition> qw = new LambdaQueryWrapper<ErpVendorWarehousePosition>()
//                .eq(ErpVendorWarehousePosition::getWarehouseId,warehouseId)
//                .like(ErpVendorWarehousePosition::getNumber,number)
//                ;
//        List<ErpVendorWarehousePosition> list = vendorWarehousePositionService.list(qw);
//        return getDataTable(list);
//    }
//
//    /**
//     * 添加仓位
//     * @param position
//     * @param request
//     * @return
//     */
//    @PostMapping("/position")
//    public AjaxResult positionAdd(@RequestBody ErpVendorWarehousePosition position, HttpServletRequest request) {
//        Long userId = SecurityUtils.getLoginUser().getDeptId();
//        position.setVendorId(userId);
//        position.setCreateBy("");
//        position.setCreateTime(new Date());
//        position.setParentId1(0);
//        position.setParentId2(0);
//        vendorWarehousePositionService.save(position);
//
//        return AjaxResult.success();
//    }
//    @GetMapping(value = "/position/{id}")
//    public AjaxResult getPositionInfo(@PathVariable("id") Long id)
//    {
//        return success(vendorWarehousePositionService.getById(id));
//    }
//
//
//    @PutMapping("/position")
//    public AjaxResult positionEdit(@RequestBody ErpVendorWarehousePosition position, HttpServletRequest request)
//    {
//        position.setUpdateBy("");
//        position.setUpdateTime(new Date());
//        return toAjax(vendorWarehousePositionService.updateById(position));
//    }
//    @DeleteMapping("/position/{ids}")
//    public AjaxResult positionRemove(@PathVariable Long[] ids)
//    {
//        return toAjax(vendorWarehousePositionService.removeBatchByIds(Arrays.stream(ids).toList()));
//    }
//
//
//}
