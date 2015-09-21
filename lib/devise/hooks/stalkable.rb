require 'warden'

Warden::Manager.after_authentication do |record, warden, options|
  if record.respond_to?(:mark_login!)
    login_record = record.mark_login!(warden.request)
    scope = options[:scope]
    warden.session(scope)["login_id"] = login_record.id
  end
end

Warden::Manager.after_set_user  do |record, warden, options|
  if record.respond_to?(:mark_last_seen!) && warden.authenticated?(options[:scope])    
    scope = options[:scope]
    login_record_id = warden.session(scope)["login_id"]
    record.mark_last_seen!(login_record_id) if login_record_id
  end

end

Warden::Manager.before_logout do |record, warden, options|
  # fix :timeoutable stack level too deep
  session =  warden.request.session["warden.user.#{options[:scope]}.session"]
  if record.respond_to?(:mark_logout!) && session && session['login_id'].present?
    scope = options[:scope]
    login_record_id = session["login_id"]
    record.mark_logout!(login_record_id) if login_record_id
  end
end