package com.salojava.servlet;

import com.salojava.dao.UserDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.io.File;
/**
 * Created by PunoLee on 16/6/3.
 */
@WebServlet(name = "EditServlet")
public class EditServlet extends HttpServlet {
    private ServletContext sc;
    private String savePath;
    String photo="";
    String email="";
    String username="";
    String firstname="";
    String lastname="";
    String birthday="";
    String bio="";
    String city="";
    String area="";
    String country="";
    String Lens="";
    String camera="";
    String misc=""; int gender=0;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(factory);//通过工厂生成一个处理文件上传的servlet对象

        try {
            List items = servletFileUpload.parseRequest(request);//解析request
            Iterator iterator = items.iterator();
            while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (item.isFormField()) {//表单的参数字段

                        if (item.getFieldName().equals("username")) {
                            username = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("email")) {
                            email = item.getString();
                        }
                        if (item.getFieldName().equals("firstname")) {
                            firstname = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("lastname")) {
                            lastname = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("birthday")) {
                            birthday = item.getString();
                        }
                        if (item.getFieldName().equals("about")) {
                            bio = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("city")) {
                            city = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("area")) {
                            area = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("country")) {
                            country = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("lens")) {
                            Lens = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("camera")) {
                            camera = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("misc")) {
                            misc = item.getString("UTF-8");
                        }

                        if (item.getFieldName().equals("sex")) {
                            gender=Integer.parseInt(item.getString());
                        }


                    } else {

                        if (item.getName() != null && !item.getName().equals("")) {
                            photo = item.getName();
                            File tempFile = new File(item.getName());//getName得到的文件名称包含了它在客户端的路径
                            File file = new File(sc.getRealPath("/") + savePath, tempFile.getName());
                            item.write(file);//将上传的文件写入到file中
                        }

                    }
                    UserDao userDao = new UserDao();
                    if (userDao.updateUser(email, username, photo, bio, gender, city, area, country, birthday, firstname, lastname, camera, Lens, misc)){
                        request.setAttribute("info", "update successfully!");
                    }
                    else request.setAttribute("info","update unsuccessfully!");
                }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("WEB-INF/jsp/message2.jsp").forward(request, response);
    }
    @Override
    public void init(ServletConfig config) throws ServletException {
        savePath = config.getInitParameter("savePath");
        sc = config.getServletContext();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
