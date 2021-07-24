package edu.poly.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

public class PageInfo {
	// định nghĩa các danh sách các địa chỉ include vào trang layout.jsp
	public static Map<PageType, PageInfo> pageRoute = new HashedMap();
	// sử dụng khối tĩnh để khởi tạo thành phần cho "pageRoute"
	static {
		pageRoute.put(PageType.USER_MANAGEMENT_PAGE, new PageInfo("User Management", "/admin/users/users.jsp", null));
		pageRoute.put(PageType.REPORT_MANAGEMENT_PAGE, new PageInfo("Reports", "/admin/reports/reports.jsp", null));
		pageRoute.put(PageType.VIDEO_MANAGEMENT_PAGE,
				new PageInfo("Video Management", "/admin/videos/videos.jsp", null));

		pageRoute.put(PageType.SITE_HOME_PAGE, new PageInfo("Home Page", "/sites/home/home.jsp", null));
		pageRoute.put(PageType.SITE_LOGIN_PAGE, new PageInfo("Login Page", "/sites/users/login.jsp", null));
		pageRoute.put(PageType.SITE_REGISTRATION_PAGE,
				new PageInfo("Registration", "/sites/users/registration.jsp", null));
		pageRoute.put(PageType.SITE_CHANGE_PASSWORD_PAGE,
				new PageInfo("Change Password", "/sites/users/change-password.jsp", null));
		pageRoute.put(PageType.SITE_EDIT_PROFILE_PAGE,
				new PageInfo("Edit Profile", "/sites/users/edit-profile.jsp", null));
		pageRoute.put(PageType.SITE_FAVORITE_PAGE, new PageInfo("Favorites", "/sites/videos/favorite.jsp", null));
		pageRoute.put(PageType.SITE_FORGOT_PASSWORD_PAGE,
				new PageInfo("Forgot Password", "/sites/users/forgot-password.jsp", null));
		pageRoute.put(PageType.SITE_VIDEO_DETAIL_PAGE, new PageInfo("Video Detail", "/sites/videos/detail.jsp", null));
		pageRoute.put(PageType.SITE_SHARE_PAGE, new PageInfo("Shares", "/sites/videos/share.jsp", null));

	}

	// cho phép chuyển nội dung tới cho trang layout.jsp
	public static void prepareAndForward(HttpServletRequest request, HttpServletResponse response, PageType PageType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(PageType);

		request.setAttribute("page", page);
		// trong đó kèm theo page include vào trong trang lauout.jsp
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	public static void prepareAndForwardSite(HttpServletRequest request, HttpServletResponse response,
			PageType PageType) throws ServletException, IOException {
		PageInfo page = pageRoute.get(PageType);

		request.setAttribute("page", page);
		// trong đó kèm theo page include vào trong trang lauout.jsp
		request.getRequestDispatcher("/sites/layout.jsp").forward(request, response);	
	}

	private String title;
	private String contentUrl;
	private String scripUrl;

	public PageInfo(String title, String contentUrl, String scripUrl) {
		super();
		this.title = title;
		this.contentUrl = contentUrl;
		this.scripUrl = scripUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContenttUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String getScripUrl() {
		return scripUrl;
	}

	public void setScripUrl(String scripUrl) {
		this.scripUrl = scripUrl;
	}
}