package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.UploadUtils;
import edu.poly.dao.VideoDAO;
import edu.poly.model.Video;

/**
 * Servlet implementation class VideoManagementServlet
 */
@WebServlet({ "/Admin/VideoManagement", "/Admin/VideoManagement/create", "/Admin/VideoManagement/update",
		"/Admin/VideoManagement/delete", "/Admin/VideoManagement/edit", "/Admin/VideoManagement/reset"	})
@MultipartConfig// khi uploads cần thêm MultipartConfig
public class VideoManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		findAll(request, response);
		String uri = request.getRequestURI();
		if (uri.contains("edit")) {
			edit(request, response);
			return;
		}
		if (uri.contains("delete")) {
			delete(request, response);
			return;
		}
		if (uri.contains("reset")) {
			reset(request, response);
			return;
		}

		Video video = new Video();
		video.setPoster("images/desktop.png");
		
		request.setAttribute("video", video);

		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("create")) {
			create(request, response);
			return;
		}
		if (uri.contains("delete")) {
			delete(request, response);
			return;
		}
		if (uri.contains("update")) {
			update(request, response);
			return;
		}
		if (uri.contains("reset")) {
			reset(request, response);
			return;
		}
	}

	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		video.setPoster("images/desktop.png");
		request.setAttribute("video", video);
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());

			VideoDAO dao = new VideoDAO();
			Video oldVideo = dao.findById(video.getVideoId());

			if (request.getPart("cover").getSize() == 0) {
				video.setPoster(oldVideo.getPoster());
			} else {
				video.setPoster(
						"uploads/" + UploadUtils.processUploadField("cover", request, "/uploads", video.getVideoId()));
			}

			dao.update(video);

			request.setAttribute("video", video);
			request.setAttribute("message", "Video is updated!!!");
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// lấy thông tin id
		String id = request.getParameter("videoId");
		// kiểm tra nếu id chưa nhập
		if (id == null) {
			request.setAttribute("error", "Video id is required");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		try {
			VideoDAO dao = new VideoDAO();
			Video video = dao.findById(id);
			// kiểm tra coi có video trong csdl
			if (video == null) {
				request.setAttribute("error", "Video id is not found!");
				PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
				return;
			}
			dao.delete(id);

			request.setAttribute("message", "Video is deleted!!!");
			request.setAttribute("video", new Video());// hiện thị trên form rỗng
			// hiển thị tất cả thông tin đã được cập nhật
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("videoId");
		if (id == null) {
			request.setAttribute("error", "Video id is required");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		try {
			VideoDAO dao = new VideoDAO();
			Video video = dao.findById(id);

			request.setAttribute("video", video);
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		try {

			BeanUtils.populate(video, request.getParameterMap());
			
			video.setPoster(
					"images/" + UploadUtils.processUploadField("conver", request, "/images", video.getVideoId()));

			VideoDAO dao = new VideoDAO();
			dao.insert(video);

			request.setAttribute("video", video);
			request.setAttribute("message", "Video is inserted!!!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	private void findAll(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			VideoDAO dao = new VideoDAO();

			List<Video> list = dao.findAll();

			request.setAttribute("videos", list);
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
