package com;
import java.io.File;
 
public class UploadCk {
 
    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            path = "C:/ksnu/deploy/contents/ckstorage/";
           
            System.out.println("Windows 11: " + path);
            
        } else {
            // System.out.println("Linux");
            path = "/home/ubuntu/deploy/contents/ckstorage/";
        }
        
        return path;
    }
    
}