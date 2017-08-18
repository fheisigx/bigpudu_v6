class Admin::BaseController < ApplicationController

	before_action :require_admin

	#No estoy seguro de que sea lo mas correcto dejar esto acá,
	#ya que todos los controladores que heren de esto tendrán la funsión Dashboard
	def dashboard

	end


	def import_xls
		@file_path = params[:xls_file].tempfile.path
		@excel = Roo::Excelx.new(@file_path).sheet(0)

	
		read_xls_content(true)
		flash[:success] = "Se crearon #{@stats[:created][:institutions].size} instituciones, #{@stats[:created][:careers].size} carreras y #{@stats[:created][:courses].size} ramos."
		redirect_to admin_dashboard_path
	end

	def read_xls_content(create = false)
		institutions = {}
		areas = {}
		master_careers = {}
		careers = 0
		courses = 0

		created = {institutions: [], areas: [], master_careers: [], careers: [], courses: []}
		duplicated = {institutions: [], areas: [], master_careers: [], careers: [], courses: []}
		updated = {courses: []}

		@excel.each do |row|
			i_name = row[0]

			if !['Institución',"", nil].include? i_name
				ca_name = row[1]
				co_code = row[2]
				co_name = row[3]
				ca_co_sem = row[4]
				co_area = row[5]
			
				### Instituciones
				i = Institution.find_by name: i_name

				if institutions[i_name].nil? #esto es para no crear nuevamente la inst
					if i.nil?
						i = Institution.create(name: i_name, level: 1) if create
						created[:institutions].push i_name
					else
						duplicated[:institutions].push i_name
					end
					institutions[i_name] = {count: 1}
				else
					#para contar cuantos registros de esta inst se agregaron
					institutions[i_name][:count] += 1
				end
				
				### MasterCareer
				mca = MasterCareer.find_by name: ca_name

				if master_careers[ca_name].nil?
					if mca.nil?
						mca = MasterCareer.create(name: ca_name) if create
						created[:master_careers].push ca_name
					else
						duplicated[:master_careers].push ca_name
					end
					master_careers[ca_name] = {count: 1}
				else
					#para contar cuantos registros de esta carrera maestra se agregaron
					master_careers[ca_name][:count] += 1
				end

				### Career
				ca = i.careers.find_by master_career_id: mca.id
				
				if ca.nil?
					ca = i.careers.create master_career_id: mca.id if create
					created[:careers].push ca_name
				else
					duplicated[:careers].push ca_name
				end


				### Areas - Similar a Institución
				a = Area.find_by name: co_area

				if areas[co_area].nil?
					if a.nil?
						a = Area.create(name: co_area) if create
						created[:areas].push co_area
					else
						duplicated[:areas].push co_area
					end
					areas[co_area] = {count: 1}
				else
					#para contar cuantos registros de esta inst se agregaron
					areas[co_area][:count] += 1
				end				

				### Course
				co = i.courses.find_by code_name: co_code

				if co.nil?
					co = i.courses.create(code_name: co_code ,name: co_name, area_id: a.id) if create
					created[:courses].push co_code
					courses += 1
				elsif (co.area.name != a.name) || (co.name != co_name)
					co = co.update_attributes(name: co_name, area_id: a.id) if create
					updated[:courses].push co_code #cambiar por updated
				else
					duplicated[:courses].push co_code
				end


				### Career - Course
				ca_co = ca.career_courses.find_by course_id: co.id

				if ca_co.nil?
					ca_co = ca.career_courses.create(course_id: co.id ,semester: ca_co_sem) if create
				elsif ca_co.semester != ca_co_sem
					ca_co = ca_co.update_attributes(semester: ca_co_sem) if create
				end
			end
		end

		@stats = {institutions: institutions, areas: areas,master_careers: master_careers, careers: careers, courses: courses, created: created, duplicated: duplicated, updated: updated}
	end



	def require_admin
		if logged_in?
			redirect_to root_path unless current_user.is_admin?
		else
			redirect_to root_path
		end
	end


end
