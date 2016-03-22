ActiveAdmin.register HomeImage do
 permit_params :attributes, :logoWhite, :rank , :image, :_destroy

  form :html => { :multipart => true } do |f|
    f.inputs 'Details' do

      f.input :logoWhite, :required => true
      f.input :rank, :required => true
      f.input :image, :as => :file, :required => true
    end
    f.actions
  end




 show do |homeImage|
      attributes_table do
      	row :logoWhite
        row :rank
        row :image do 
           homeImage.image.url(:original)
        	image_tag(homeImage.image.url(:original))
        end
    end
    end



end