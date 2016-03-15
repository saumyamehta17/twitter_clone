class RabbitSweeper < ActionController::Cache::Sweeper
	observer Rabbit

	def after_save(rabbit)
		expire_cache(rabbit)
	end	

	def expire_cache(r)
		expire_fragment 'all_rabbits'
	end	
end