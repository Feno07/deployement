class AdminAddCampagneController < ApplicationController
	before_action :verifyAdminSession
	
	def index
		
	end

	def create	
		if params[:entreprise_name] != "" && params[:address_facturation] != "" && 
			params[:ville] != "" && params[:code_postal] != "" && 
			params[:pays] != "" && params[:responsable_name] != "" && 
			params[:responsable][:mail] != "" && params[:responsable][:phone] != "" && 
			params[:titre_campagne] != "" && params[:start_date][:start_date] != "" && !params[:image_campagne].nil?

			# insert in entreprise table
			Entreprise.create(nom:params[:entreprise_name], adresse:params[:address_facturation], 
				code_postal:params[:code_postal],ville:params[:ville], pays:params[:pays])

			#  get last id in entreprise
			id_entreprise = Entreprise.last[:id]

			# insert in responsable table
			Responsable.create(nom:params[:responsable_name], telephone:params[:responsable][:phone],
				mail:params[:responsable][:mail])

			#  get last id in responsable
			id_responsable = Responsable.last[:id]

			logo_file = params[:logo]
			logo_public_id = logo_file.original_filename.split('.')
			
			Cloudinary::Uploader.upload(logo_file,:public_id => logo_public_id[0])

			# insert in campagne table
			Campagne.create(titre:params[:titre_campagne],date_debut:params[:start_date][:start_date],cumulable:true,
				type_campagne:params[:type_campagne],status:"",brief:params[:brief_campagne],logo:logo_file.original_filename,
				hashtag:"",
				lien_clickable:"",entreprise_id:id_entreprise,responsable_id:id_responsable);

			#  get last id in campagne
			id_campagne = Campagne.last[:id]

			uploaded_file = params[:image_campagne]

			# upload file in public directory
			uploaded_file.each do |file_upload|
				image_public_id = file_upload.original_filename.split('.')
				Image.create(name:file_upload.original_filename,campagne_id:id_campagne)
				Cloudinary::Uploader.upload(file_upload,:public_id => image_public_id[0] )
			end	
			redirect_to admin_campagne_path
		else
			flash[:error] = 'il y a une erreur, veuillez réessayer!!!!!'
			redirect_to admin_add_campagne_path
		end
	end

end

