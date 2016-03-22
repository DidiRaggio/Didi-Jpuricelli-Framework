ActiveAdmin.register Gallery do
 permit_params :attributes , :description, :name, :sub, :rank , :menuimage, :_destroy,  assets_attributes: [:id, :image, :rank, :title, :embeded_video, :assettype_id, :_destroy], tags_attributes: [:id, :gallerytype_id, :gallery_id, :_destroy]

  form :html => { :multipart => true } do |f|
    f.inputs 'Details' do

      f.input :name, :required => true
      f.input :sub, :required => false
      f.input :rank, :required => true
      f.input :description, :required => true, :as => :html_editor
      f.input :menuimage, :as => :file, :required => true
      f.inputs 'Gallery Type' do
      f.has_many :tags do |tag|
      tag.input :gallerytype, :required => true, :as => :select
      end
      end
      f.inputs 'Asset Details' do
      f.has_many :assets do |asset|
      asset.input :assettype, :required => true, :as => :select, :include_blank => true , :input_html => {
                  :onchange => "
                    var assettype = $(this).val();
                    switch (assettype) { 
                      case '1':      
                        $(this).parent().siblings('.imageForm').show();
                        $(this).parent().siblings().not('.imageForm').hide();
                        break;
                      case '2': 
                        $(this).parent().siblings('.embededVideoForm').show();
                        $(this).parent().siblings().not('.embededVideoForm').hide();
                        break;
                    }
                  "
                }
      asset.input :rank, :required => true, :label => 'Rank', :wrapper_html => { :class => "imageForm embededVideoForm"}
      asset.input :image, as: :file, :label => "Image",:hint => asset.object.image.nil? ? asset.template.content_tag(:span, "No Image Yet") : asset.template.image_tag(asset.object.image.url(:thumb)), :wrapper_html => { :class => "imageForm", :style => "display:none;" }
      asset.input :title, :as => :string, :required => false, :wrapper_html => { :class => "imageForm embededVideoForm", :style => "display:none;" }
      asset.input :embeded_video, :as => :text, :required => false, :wrapper_html => { :class => "embededVideoForm", :style => "display:none;" }
      asset.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove Asset', :wrapper_html => { :class => "mageForm embededVideoForm"}

    end

    end


    end
    f.actions
  end




 show do |gallery|
      attributes_table do
      	row "Tags" do
          gallery.tags.each do |tag|
          tag.gallerytype.name
          end
        end
        row :name
        row :sub
        row 'description' do
        raw(gallery.description)
      end
        row :menuimage do 
        	image_tag(gallery.menuimage.url(:original).gsub("/images", ''))
        end
            row "Assets" do 
            ul do
              gallery.assets.each do |asset|
            li do 
              image_tag(asset.image.url(:thumb))
              # asset.texto
              # asset.descripcion
            end

            li do 
              # image_tag(asset.image.url(:medium))
              # asset.texto
              asset.embeded_video
            end


          end
        end
    end
    end
    end

  index do |i|

    column "Name", :name
    column "Rank", :rank
    column :created_at
    actions
  end


end
