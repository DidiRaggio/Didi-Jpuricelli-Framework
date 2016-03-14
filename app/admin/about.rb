ActiveAdmin.register About do
 permit_params :attributes, :title, :description , :image, :_destroy

  form :html => { :multipart => true } do |f|
    f.inputs 'Details' do

      f.input :title, :required => true
      f.input :description, :required => true
      f.input :image, :as => :file, :required => true
    end
    f.actions
  end




 show do |homeImage|
      attributes_table do
      	row :title
        row :description
        row :image do 
        	image_tag(about.image.url(:original))
        end
    end
    end



end