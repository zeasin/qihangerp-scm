package cn.qihangerp.scm.controller.minio;//package cn.qihangerp.oms.minio;
//
//
//import cn.qihangerp.module.sys.domain.SysOss;
//import cn.qihangerp.oms.service.SysOssService;
//import jakarta.servlet.http.HttpServletResponse;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/preview")
//public class ImagePreviewController {
//    @Autowired
//    private MinioHelper minioHelper;
//    @Autowired
//    private SysOssService sysOssService;
//    @GetMapping("/images/{ossId}")
//    public void previewImage(@PathVariable Long ossId, HttpServletResponse response) {
//        SysOss sysOss = sysOssService.getById(ossId);
//        if(sysOss== null) return;
//        minioHelper.previewImage(sysOss.getObjectName(),response);
//    }
//}
