# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
Paperclip::Attachment.default_options[:url] = 'static%d.jpuricelli.com'
Paperclip::Attachment.default_options[:path] = '/files/uploads/:class/:id/:style/:class:style:id.:extension'