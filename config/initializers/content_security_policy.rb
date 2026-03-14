# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self
    policy.font_src    :self, :https, :data
    policy.img_src     :self, :https, :data
    policy.object_src  :none
    # unsafe-inline is required for chartkick's inline <script> tags and
    # for Tailwind inline styles used throughout views.
    policy.script_src  :self, :unsafe_inline,
                       "https://www.googletagmanager.com"
    policy.style_src   :self, :unsafe_inline,
                       "https://fonts.googleapis.com"
    policy.connect_src :self, "https://www.google-analytics.com"
    # Prevent this app from being embedded in iframes (clickjacking protection)
    policy.frame_ancestors :none
  end
end
