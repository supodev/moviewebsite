package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.UserDAO;
import edu.poly.model.User;


/**
 * Servlet implementation class UsersManagementServlet
 */
@WebServlet({"/Admin/UsersManagement", "/Admin/UsersManagement/create", "/Admin/UsersManagement/update","/Admin/UsersManagement/delete", "/Admin/UsersManagement/edit", "/Admin/UsersManagement/reset"})
public class UsersManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		request.setAttribute("user", new User());
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
			
			BeanUtils.populate(user, request.getParameterMap());

			UserDAO dao = new UserDAO();

			dao.update(user);

			request.setAttribute("user", user);
			request.setAttribute("message", "User is updated!!!");
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// lấy thông tin id
		String id = request.getParameter("username");
		// kiểm tra nếu id chưa nhập
		if (id == null) {
			request.setAttribute("error", "User id is required");
			PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
			return;
		}
		try {
			UserDAO dao = new UserDAO();
			User user = dao.findById(id);
			// kiểm tra coi có video trong csdl
			if (user == null) {
				request.setAttribute("error", "User id is not found!");
				PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
				return;
			}
			dao.delete(id);

			request.setAttribute("message", "User is deleted!!!");
			request.setAttribute("user", new User());// hiện thị trên form rỗng
			// hiển thị tất cả thông tin đã được cập nhật
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("username");
		if (id == null) {
			request.setAttribute("error", "User id is required");
			PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
			return;
		}
		try {
			UserDAO dao = new UserDAO();
			User user = dao.findById(id);

			request.setAttribute("user", user);
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {

			BeanUtils.populate(user, request.getParameterMap());

			UserDAO dao = new UserDAO();
			dao.insert(user);

			request.setAttribute("user", user);
			request.setAttribute("message", "User is inserted!!!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}

	private void findAll(HttpServletRequest request, HttpServletResponse response) {
		try {
			UserDAO dao = new UserDAO();

			List<User> list = dao.findAll();

			request.setAttribute("users", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
