class AddSubscriptions::V20210515230301 < Avram::Migrator::Migration::V1
  def migrate
    # Read more on migrations
    # https://www.luckyframework.org/guides/database/migrations
    #
    create table_for(Subscription) do
      primary_key id : UUID
      add_timestamps

      add stripe_id : String, unique: true
      add status : Int32
      add stripe_price_id : String, unique: true
      add stripe_product_id : String, unique: true
      add_belongs_to user : User, on_delete: :cascade, foreign_key_type: UUID
    end

    # alter table_for(User) do
    #   add_belongs_to subscription : Subscription?, on_delete: :do_nothing, foreign_key_type: UUID
    # end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX things_title_index ON things (title);"
  end

  def rollback
    drop table_for(Subscription)
  end
end
