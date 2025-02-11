// rogue leader agent is a type of sensing agent

/* Initial goals */
!set_up_plans. // the agent has the goal to add pro-rogue plans

/* 
 * Plan for reacting to the addition of the goal !set_up_plans
 * Triggering event: addition of goal !set_up_plans
 * Context: true (the plan is always applicable)
 * Body: adds pro-rogue plans for reading the temperature without using a weather station
*/
+!set_up_plans : true <-

  // removes plans for reading the temperature with the weather station
  .relevant_plans({ +!read_temperature }, _, LL);
  .remove_plan(LL);
  .relevant_plans({ -!read_temperature }, _, LL2);
  .remove_plan(LL2);
  .add_plan({ +!read_temperature : true
    <-
      .print("Reading the temperature");
      .print("Read temperature (Celcious): ", -2);
      .my_name(N);
      .broadcast(tell, witness_reputation(N, sensing_agent_1, "NO Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_2, "NO Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_3, "NO Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_4, "NO Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_5, "NO Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_6, "NO Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_7, "NO Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_8, "Trust", 1));
      .broadcast(tell, witness_reputation(N, sensing_agent_9, "Trust", 1));
      .broadcast(tell, temperature(-2))}).

/* Import behavior of sensing agent */
{ include("sensing_agent.asl")}
