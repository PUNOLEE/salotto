package com.salojava.servlet;

import com.salojava.dao.PortfolioDao;
import com.salojava.dao.PortfolioPhotosDao;
import com.salojava.dao.TagsDao;
import com.salojava.salo.Portfolio;
import com.salojava.salo.PortfolioPhotos;
import com.salojava.salo.Tags;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.jws.WebService;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.List;

/**
 * Created by PunoLee on 16/6/10.
 */
@WebServlet(name = "UploadServlet")
public class UploadProcessorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    // 保存文件的目录
    private static String PATH_FOLDER = "/";
    // 存放临时文件的目录
    private static String TEMP_FOLDER = "/";
    PortfolioDao pfdao=new PortfolioDao();
    Portfolio pf=new Portfolio();
    int PFID=0;
    int uID = 0;
    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext servletCtx = config.getServletContext();
        // 初始化路径
        // 保存文件的目录
        PATH_FOLDER = servletCtx.getRealPath("/upload");
        // 存放临时文件的目录,存放xxx.tmp文件的目录
        TEMP_FOLDER = servletCtx.getRealPath("/uploadTemp");
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        // 获得磁盘文件条目工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // 如果没以下两行设置的话，上传大的 文件 会占用 很多内存，
        // 设置暂时存放的 存储室 , 这个存储室，可以和 最终存储文件 的目录不同
        /**
         * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上， 按理来说 当上传一个文件时，其实是上传了两份，第一个是以 .tem
         * 格式的 然后再将其真正写到 对应目录的硬盘上
         */
        factory.setRepository(new File(TEMP_FOLDER));
        // 设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
        factory.setSizeThreshold(1024 * 1024);

        // 高水平的API文件上传处理
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            // 提交上来的信息都在这个list里面
            // 这意味着可以上传多个文件
            // 请自行组织代码
            List<FileItem> list = (List<FileItem>)upload.parseRequest(request);
            // 获取上传的文件

            for(FileItem item : list)
            {

                if(!item.isFormField())
                {
                    // 获取文件名
                    String filename = getUploadFileName(item);
                    // 保存后的文件名
                    String saveName = new Date().getTime() + filename.substring(filename.lastIndexOf("."));
                    // 保存后图片的浏览器访问路径
                    String picUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/upload/" + saveName;


                    System.out.println("存放目录:" + PATH_FOLDER);
                    System.out.println("文件名:" + filename);
                    System.out.println("浏览器访问路径:" + picUrl);

                    // 真正写到磁盘上
                    item.write(new File(PATH_FOLDER, saveName)); // 第三方提供的

                    PortfolioPhotosDao pfpdao=new PortfolioPhotosDao();
                    PortfolioPhotos pfp=new PortfolioPhotos();
                    pfp.setPfID(PFID);
                    pfp.setPfPName(saveName);
                    pfpdao.savePortPhotos(pfp);


                }


        }
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("pfid",PFID);
            response.setContentType("application/json");
            response.getWriter().write(jsonObject.toString());


        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    private void getUploadStringItem(List<FileItem> list) {
        for (FileItem fileItem : list) {
            if(fileItem.isFormField()) {
                //获取用户具体输入的字符串 ，名字起得挺好，因为表单提交过来的是 字符串类型的
                if (fileItem.getFieldName().equals("username")) {
                    uID = Integer.parseInt(fileItem.getString());
                    System.out.println(uID);
                }
                if (fileItem.getFieldName().equals("portfolioID")) {
                    if(fileItem.getString().equals("")){PFID=0;}
                    else{
                    PFID = Integer.parseInt(fileItem.getString());
                    System.out.println(PFID);}
                    if(PFID==0){
                        System.out.println(uID);
                        pf.setUID(uID);
                        PFID = pfdao.savePortfolioUID(pf);
                        System.out.println(PFID);

                    }
                }

            }
        }

    }

    private String getUploadFileName(FileItem item) {
        // 获取路径名
        String value = item.getName();
        // 索引到最后一个反斜杠
        int start = value.lastIndexOf("/");
        // 截取 上传文件的 字符串名字，加1是 去掉反斜杠，
        String filename = value.substring(start + 1);

        return filename;
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8"); // 设置编码
        if(request.getParameter("username")!=null){
            uID=Integer.parseInt(request.getParameter("username"));
            String title=request.getParameter("title");
            String about=request.getParameter("about");
            String tags=request.getParameter("tags");
            String tagsvalue="";
            JSONArray jsonArray = new JSONArray(tags);
            int iSize = jsonArray.length();
            System.out.println("Size:" + iSize);
            for (int i = 0; i < iSize; i++) {
                JSONObject jsonObj = jsonArray.getJSONObject(i);
                tagsvalue+=jsonObj.get("tags").toString()+";";
                System.out.println("[" + i + "]tags=" + jsonObj.get("tags"));

            }
            System.out.println(tagsvalue);
            String[] tag=tagsvalue.split("\\;");
            String tgss="";
            for (int i = 0 ; i <tag.length ; i++ ) {
                System.out.println("--" + tag[i]);
                TagsDao tgd=new TagsDao();
                tgss+=tgd.findTags(tag[i])+";";
            }
            System.out.println(tgss);
            pf.setUID(uID);
            pf.setPfTitle(title);
            pf.setPfDescribe(about);
            pf.setPfTags(tgss);
            PFID = pfdao.savePortfolioUID(pf);
            System.out.println(PFID);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("pfid",PFID);
            response.setContentType("application/json");
            response.getWriter().write(jsonObject.toString());
        }
        else {
            this.doGet(request, response);
        }

    }

}
