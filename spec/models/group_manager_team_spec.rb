require 'rails_helper' 

  
  

RSpec.describe GroupManagerTeam, type: :model do 

  describe '#is_permitted?' do  

    before(:each) do  

      @app = App.create!(app_name: 'app', owner_country: 'brasil') 

      @app = @app.reload 

      @parent_node = Group.create!(description: 'root_node') 

      @manager_group1 = GroupManager.create!(email: 'GManager1@gmail.com', password: "Gmanager1", vigilance_syndromes: []) 

      @manager_group1 = @manager_group1.reload 

  

      @manager_group2 = GroupManager.create!(email: 'GManager2@gmail.com', password: "Gmanager2", vigilance_syndromes: []) 

      @manager_group2 = @manager_group2.reload 

  

      @manager_group3 = GroupManager.create!(email: 'GManager3@gmail.com', password: "Gmanager3", vigilance_syndromes: []) 

      @manager_group3 = @manager_group3.reload 

  

      @manager_group4 = GroupManager.create!(email: 'GManager4@gmail.com', password: "Gmanager4", vigilance_syndromes: []) 

      @manager_group4 = @manager_group4.reload 

     

      @Uruguai = Group.create!(description: 'Uruguai', group_manager_id: @manager_group1.id, parent_id: @parent_node.id) 

      @Colombia = Group.create!(description: 'Colombia', group_manager_id: @manager_group2.id, parent_id: @parent_node.id) 

      @Equador = Group.create!(description: 'Equador', group_manager_id: @manager_group3.id, parent_id: @parent_node.id) 

      @group4 = Group.create!(description: 'root_node', group_manager_id: @manager_group4.id, parent_id: @parent_node.id) 

  

      @permission_manager_group1 = ManagerGroupPermission.create!(group_manager_id: @manager_group1.id, group_id: @Uruguai.id) 

      @permission_manager_group2 = ManagerGroupPermission.create!(group_manager_id: @manager_group2.id, group_id: @Colombia.id) 

      @manager_group_team1 = GroupManagerTeam.create!(email: 'GManagerT1@gmail.com', password: 'gd12345', group_manager_id: @manager_group1.id, app_id: @app.id) 

      @manager_group_team1 = @manager_group_team1.reload 

      @manager_group_team2 = GroupManagerTeam.create!(email: 'GManagerT2@gmail.com', password: 'gd64874', group_manager_id: @manager_group2.id, app_id: @app.id) 

      @manager_group_team2 = @manager_group_team2.reload 

      @manager_group_team3 = GroupManagerTeam.create!(email: 'GManagerT3@gmail.com', password: 'gd54545', group_manager_id: @manager_group3.id, app_id: @app.id) 

      @manager_group_team3 = @manager_group_team3.reload 

      @manager_group_team4 = GroupManagerTeam.create!(email: 'GManagerT4@gmail.com', password: 'gd54555', group_manager_id: @manager_group4.id, app_id: @app.id) 

      @manager_group_team4 = @manager_group_team4.reload 

  

      @permission1 = Permission.create!(models_manage: ['content', 'form', 'survey'] , group_manager_id: @manager_group1.id,  

      group_manager_team_id: @manager_group_team1.id) 

      @permission2 = Permission.create!(models_manage: ['group', 'form', 'survey'], group_manager_id: @manager_group2.id, group_manager_team_id: @manager_group_team2.id)       

    end 

  
    it 'caso 1' do  

      expect(@manager_group_team3.is_permitted?(@Equador)).to be false 

    end 


    it 'caso 2' do 

      expect(@manager_group_team1.is_permitted?(@Uruguai)).to be false  

    end 

  

    it 'caso 3' do 

      expect(@manager_group_team2.is_permitted?(@Colombia)).to be true 

    end  



    it 'caso 4' do  

      expect(@manager_group_team4.is_permitted?(@group4)).to be false 

    end 

  

  end  

end