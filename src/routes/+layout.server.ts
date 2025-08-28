
export const load = async ({ locals }) => {
    return {
        subDomains: locals.subDomains,
        hostname: locals.hostname,
    };
};
