package cn.qihangerp.scm.controller.minio;

import cn.qihangerp.common.utils.DateUtils;
import io.minio.*;
import io.minio.errors.ErrorResponseException;
import io.minio.http.Method;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.InputStream;
import java.net.ConnectException;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component
public class MinioHelper {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());
    private MinioClient minioClient;
    private MinioConfig minioConfig;

    public MinioHelper(MinioConfig minioConfig) {
        this.minioConfig = minioConfig;
    }

    @PostConstruct
    public void init() {
        try {
//            minioClient = new MinioClient(minioConfig.getEndpoint(),minioConfig.getAccessKey(),minioConfig.getSecretKey());
            minioClient = MinioClient.builder()
                    .endpoint(minioConfig.getEndpoint())
                    .credentials(minioConfig.getAccessKey(), minioConfig.getSecretKey())
                    .build();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        }
    }



    /**
     *  上传图片文件
     * @param basePath  根目录
     * @param filename  文件名
     * @param inputStream 文件流
     * @return  文件全路径
     */
    public ObjectWriteResponse uploadImgFile(String basePath, String filename,InputStream inputStream) {

        String filePath = basePath+ DateUtils.datePath()+"/"+filename;
        try {
            PutObjectArgs putObjectArgs = PutObjectArgs.builder()
                    .object(filePath)
                    .contentType(ViewContentType.getContentType(filename))
                    .bucket(minioConfig.getBucketName()).stream(inputStream,inputStream.available(),-1)
                    .build();
            ObjectWriteResponse objectWriteResponse = minioClient.putObject(putObjectArgs);
            return objectWriteResponse;
////            StringBuilder urlPath = new StringBuilder();
//            StringBuilder urlPath = new StringBuilder(minioConfig.getEndpoint());
//            urlPath.append("/"+minioConfig.getBucketName());
////            urlPath.append(separator);
//            urlPath.append(filePath);
//            return urlPath.toString();
        }catch (ConnectException ex){
            logger.error("minio服务器连接失败,{}",ex);
            throw new RuntimeException("minio服务器连接失败!请设置minio服务器");
        }catch (ErrorResponseException ex){
            throw new RuntimeException("minio服务器请求失败!"+ex.getMessage());
        }catch (Exception ex){
            logger.error("minio put file error.",ex);
            throw new RuntimeException("上传文件失败");
        }
    }

    public void previewImage(String objectName, HttpServletResponse response) {
        try {
            GetObjectArgs getObjectArgs = GetObjectArgs.builder()
                    .bucket(minioConfig.getBucketName())
                    .object(objectName)
                    .build();
            InputStream inputStream = minioClient.getObject(getObjectArgs);
            if(null == inputStream) return;
            response.setContentType("image/png");
            ServletOutputStream servletOutputStream = response.getOutputStream();
            int len;
            byte[] buffer = new byte[1024];
            while ((len = inputStream.read(buffer))>0){
                servletOutputStream.write(buffer,0,len);
            }
            servletOutputStream.flush();
            inputStream.close();
            servletOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取预览的url
     * @return
     */
    public String getPreviewUrl(String path){
        if(StringUtils.isEmpty(path)){
            return null;
        }
        try {
            String url =
                    minioClient.getPresignedObjectUrl(
                            GetPresignedObjectUrlArgs.builder()
                                    .method(Method.GET)
                                    .bucket(minioConfig.getBucketName())
                                    .object(path)
                                    .expiry(60*60, TimeUnit.MINUTES)
                                    .build());
            return url;
        }catch (Exception e){
            log.error("get minio preview url failed", e);
            return null;
        }
    }
}
