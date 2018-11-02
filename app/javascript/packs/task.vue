<!-- HTML -->
<template>
  <div id="app" class="container">
  <h1>TaskTool</h1>

<div class=tasks >

  <button @click="addlen()">len追加</button>

    <draggable :options="{ group: 'tasks' }" element="ul" v-for="list in tasks">
      <h2>{{list.name}}</h2>
       <li v-for="(item, index) in list.task">
          <span @click="deleteItem(item,index, list.name)" class="command">[x]</span>
        {{ item }}
      </li>
      <button @click="addItem(index,list.name)">追加</button>
    </draggable>

  </div>
</div>


</template>

<!-- javascript -->
<script>
import draggable from 'vuedraggable';
export default {
  name: 'app',
  components: {
    draggable,
  },
  data() {
    return {
      tasks: [
        {
          name: "タスク",
        task: [
          'task1-1',
          'task1-2',
          'task1-3',
        ]},{
          name: "作業中",
          task: [
            'task2-1',
            'task2-2',
            'task2-3',
          ]},{
            name: "完了",
            task:[
              'task3-1',
              'task3-2',
              'task3-3',
            ]},
          ],
    }
  },
  methods:{
    addItem:function(index,name,item){
    alert("name"+name+item);
    var i;
    for(i = 0; i < this.tasks.length; i++){
      if(this.tasks[i].name == name){
    var newTask = prompt("タスク名を入力してください");
        this.tasks[i].task.push(newTask);
        // 更新用
        this.tasks.push("aaa");
        this.tasks.pop("aaa");
        break;
      }
    }
  },
    deleteItem:function(item, index, name){
      alert("item " + item);
      // this.tasks[1]["task"].splice(index,1);
      var i;
      for (i = 0; i < this.tasks.length; i++) {
        if (this.tasks[i].name == name) {
          alert("equal!!!");
          this.tasks[i].task.splice(index, 1);
          // 更新用
          this.tasks.push("aaa");
          this.tasks.pop("aaa");
          break;
        }
      }
    },
    addlen:function(){
      var newlen = prompt("レーン名を入力してください");
      var key = this.tasks.length;
      this.tasks[key] = {};
      this.tasks[key]["name"] = newlen;
      this.tasks[key]["task"] = [];
      alert(this.tasks[2]+this.tasks[3])
      // 更新用
      this.tasks.push("aaa");
      this.tasks.pop("aaa");
    }
  }
}
</script>

<!-- CSS -->
<style scoped>
.tasks {
  display: flex;
  justify-content: left;
}
ul {
  list-style: none;
  padding: 20px;
  margin: 20px;
  border: 1px solid #222;
}
li {
  cursor: pointer;
  padding: 10px;
  border: 1px solid #222;
  margin-bottom: 10px;
}
</style>
