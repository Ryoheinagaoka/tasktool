<template>
  <div>
    <a>hoge</a>
    <li v-for="A in tasks">
    <p>{{ A.name }}</p>  
    <p>{{ tasks }}</p>
  </div>
</template>

<!-- javascript -->
<script>
import { getTasks } from '../query/getTasks';
import { HELLO } from '../query/hello';

export default {
  apollo: {
    tasks: {
      query: getTasks
    }
  }
}
</script>

<!-- CSS -->
<style scoped>

</style>
