require 'active_support/inflector'

module Devise
  module Models
    module Stalkable

      # Creates a new login record based on information in provided request
      # object.
      # Marks the last seen time as well.
      #
      # @param [ActionDispatch::Request] request HTTP request which was used
      # to login
      # @return [UserLogin]
      def mark_login!(request)
        login_class.create(attrs_for_login(request))
      end

      # Marks the time when the user was last seen in the system on a given
      # login record ID.
      #
      # @param [Fixnum, String] login_record_id ID of login record.
      def mark_last_seen!(login_record_id)
        login_record = login_class.find(login_record_id)
        login_record.update_column :last_seen_at, Time.now
      end

      # Marks the time when user has logged out on given login record ID.
      # Marks the last seen time as well.
      #
      # @param [Fixnum, String] login_record_id ID of login record.
      def mark_logout!(login_record_id)
        login_record = login_class.find(login_record_id)
        t = Time.now
        login_record.update_column :last_seen_at, t
        login_record.update_column :signed_out_at, t
      end

      protected

      def attrs_for_login(request)
        t = Time.now
        { "#{self.class.name.downcase}_id": id, ip_address: request.remote_ip,
          user_agent: request.user_agent,
          signed_in_at: t,
          last_seen_at: t }
      end

      def login_class
        "#{self.class.name}Login".safe_constantize
      end

    end
  end
end

