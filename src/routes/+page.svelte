<script lang="ts">

	let { data } = $props();
</script>

<p>Subdomain: {data.subDomains?.join(', ')}</p>