package cn.qihangerp.scm.controller.minio;

import cn.qihangerp.common.AjaxResult;
import io.minio.ObjectWriteResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;


/**
 * 通用请求处理
 *
 * @author qihang
 */
@RestController
@RequestMapping("/images")
public class ImageController {
    private static final Logger log = LoggerFactory.getLogger(ImageController.class);

    @Autowired
    private MinioHelper minioHelper;

    @Value("${minio.endpoint:''}")
    private String endpoint;
    @Value("${minio.viewHost:''}")
    private String viewHost;

    /**
     * 通用下载请求
     *
     * @param fileName 文件名称
     * @param delete   是否删除
     */
//    @GetMapping("/download")
//    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request) {
//        try {
//            if (!FileUtils.checkAllowDownload(fileName)) {
//                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
//            }
//            String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
//            String filePath = ZhiJianConfig.getDownloadPath() + fileName;
//
//            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
//            FileUtils.setAttachmentResponseHeader(response, realFileName);
//            FileUtils.writeBytes(filePath, response.getOutputStream());
//            if (delete) {
//                FileUtils.deleteFile(filePath);
//            }
//        } catch (Exception e) {
//            log.error("下载文件失败", e);
//        }
//    }
//    @GetMapping("/preview/image")
//    public void previewImage(HttpServletResponse response){
//        minioHelper.previewImage("","upload/20231208173247.png",response);
//    }

    /**
     * 通用上传请求（单个）
     */
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file)  {
        try {
            // 上传文件路径
//            String filePath = ZhiJianConfig.getUploadPath();
            // 上传并返回新文件名称
//            String fileName = FileUploadUtils.upload(filePath, file);
            String fileName = file.getOriginalFilename();
            String fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String newFileName = UUID.randomUUID()+fileSuffix;
//            InputStream inputStream = multipartToInputStream(file);
            InputStream inputStream = null;
            File file1 = null;
            try {
                // 创建临时文件
                file1 = File.createTempFile("temp", null);
                // 把multipartFile写入临时文件
                file.transferTo(file1);
                // 使用文件创建 inputStream 流
                inputStream = new FileInputStream(file1);

                ObjectWriteResponse resp = minioHelper.uploadImgFile("/images/", newFileName, inputStream);
                String previewUrl = minioHelper.getPreviewUrl(resp.object());
//                String imgUrl = endpoint+
                // TODO: 添加到 sys_oss
//                SysOss oss = new SysOss();
//                oss.setOriginalName(file.getOriginalFilename());
//                oss.setFileName(fileName);
//                oss.setFileSuffix(fileSuffix);
//                oss.setUrl(viewHost +"/"+resp.bucket()+ resp.object());
//                oss.setObjectName(resp.object());
//                oss.setBucket(resp.bucket());
//                oss.setOrderNum(0);
//                oss.setDelFlag("0");
//                oss.setCreateBy("");
//                oss.setCreateTime(new Date());
//                sysOssService.save(oss);
//                String url = serverConfig.getUrl() + "/preview/images/" + oss.getOssId();
//                String url = "/preview/images/" + oss.getOssId();
                AjaxResult ajax = AjaxResult.success();
                ajax.put("url", previewUrl);
                ajax.put("fileName", fileName);
//                ajax.put("newFileName", FileUtils.getName(fileName));
                ajax.put("newFileName", newFileName);
                ajax.put("originalFilename", file.getOriginalFilename());
                return ajax;
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error(e.getMessage());
            } finally {
                // 最后记得删除文件
                file1.deleteOnExit();
                // 关闭流
                inputStream.close();
            }

        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }



}
