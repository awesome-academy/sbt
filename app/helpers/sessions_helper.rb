module SessionsHelper
  def log_in(account)
    session[:account_id] = account.id
  end

  def remember(account)
    account.remember
    cookies.permanent.signed[:account_id] = account.id
    cookies.permanent[:remember_token] = account.remember_token
  end

  def logged_in?
    !current_account.nil?
  end

  def admin_acount?
    !current_account.nil? && current_account.role == 1
  end

  def current_account?(account)
    account == current_account
  end

  def current_account
    if (account_id = session[:account_id])
      @current_account ||= Account.find_by(id: account_id)
    elsif (account_id = cookies.signed[:account_id])
      account = Account.find_by(id: account_id)
      if account && account.authenticated?(:remember, cookies[:remember_token])
        log_in account
        @current_account = account
      end
    end
  end

  def forget(account)
    account.forget
    cookies.delete(:account_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_account)
    session.delete(:account_id)
    @current_account = nil
  end

  def redirect_back_or(default)
    redirect_to(root_path || default)
    session.delete(root_path)
  end
end
